# Use linuxserver/vscodium as the base image
FROM linuxserver/vscodium

# Set working directory
WORKDIR /app

# Install curl
USER root
RUN apt-get update && \
  apt-get install -y curl

# Install Python
RUN apt-get install -y python3 python3-pip

# Install Ruby
RUN apt-get install -y ruby ruby-dev

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Set up entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Default to python
CMD ["python"]
