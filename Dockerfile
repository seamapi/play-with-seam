# Use linuxserver/vscodium as the base image
FROM linuxserver/vscodium

# Set working directory
# WORKDIR /app

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

COPY ./app/ /app

# Set up entrypoint
# COPY entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
COPY /root /

RUN pip3 install seamapi
RUN cd /app/ruby && gem install seamapi
RUN cd /app/javascript && npm init -y && npm add seamapi
# RUN dotnet add package seam

RUN chown -R abc /config

ENV TITLE="Play with Seam"
ENV FM_HOME="/app"

# /config/.dotnet/dotnet
# dotnet new console
# dotnet run

