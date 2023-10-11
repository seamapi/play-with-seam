# Start from a base image that already has some development tools
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install essential tools
RUN apt-get update && apt-get -y install \
    curl \
    wget \
    git \
    zip \
    unzip

# Install Python
RUN apt-get -y install \
    python3 \
    python3-pip

# Install NodeJS
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Install Ruby
RUN apt-get -y install \
    ruby \
    ruby-dev

# Install .NET SDK for C#
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get -y install dotnet-sdk-7.0

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

# Set the default shell to bash rather than sh
ENV SHELL /bin/bash
