# Use linuxserver/vscodium as the base image
FROM linuxserver/vscodium

# Set working directory
# WORKDIR /app

# Install curl
# USER root
RUN apt-get update && \
  apt-get install -y curl wget

# Install Python
# RUN apt-get install -y python3 python3-pip

# Install Ruby
RUN apt-get install -y ruby ruby-dev

# Install Node.js
RUN touch /root/.bashrc
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN . /config/.nvm/nvm.sh && \
  nvm install 20 && \
  nvm alias default 20 && \
  nvm use default
ENV PATH $NVM_DIR/v20/bin:$PATH

# Install dotnet
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
RUN chmod +x dotnet-install.sh
RUN ./dotnet-install.sh --version latest

COPY ./app/ /app

# Install Seam
# RUN pip3 install seamapi
# RUN gem install seamapi
# RUN cd /app/javascript && npm init -y && npm add seamapi

# Set up entrypoint
# COPY entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

ENV TITLE="Play with Seam"
ENV FM_HOME="/app"

# Default to python
CMD ["python"]
