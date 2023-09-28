FROM linuxserver/vscodium

USER root
RUN chown -R abc /config

USER abc
RUN codium --install-extension ms-python.python
RUN codium --install-extension rebornix.ruby
RUN codium --install-extension esbenp.prettier-vscode

USER root
RUN apt-get update && \
  apt-get install -y curl wget

# Install Python
RUN apt-get install -y python3 python3-pip python-is-python3

# Install Ruby
RUN apt-get install -y ruby ruby-dev

# Install dotnet
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
RUN chmod +x dotnet-install.sh
RUN ./dotnet-install.sh --channel 7.0
RUN ln -s /config/.dotnet/dotnet /bin/dotnet

COPY ./app/ /app

COPY /root /

USER root
RUN pip3 install seamapi
RUN cd /app/ruby && gem install seamapi
RUN cd /app/javascript && npm init -y && npm add seamapi
RUN cd /app/csharp && bash ./install.sh

USER root
RUN chown -R abc /config
RUN chown -R abc /app

ENV TITLE="Play with Seam"
ENV FM_HOME="/app"