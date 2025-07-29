# Start from a stable Ubuntu base image [cite: 1]
FROM ubuntu:22.04

# Set environment variables to prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install only essential tools for font installation
# The 'common-utils' feature will handle git, curl, zsh, sudo, etc.
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

# Install a Nerd Font (Fira Code) required for modern prompts
RUN mkdir -p /usr/local/share/fonts/FiraCode \
    && wget -O /tmp/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip \
    && unzip /tmp/FiraCode.zip -d /usr/local/share/fonts/FiraCode \
    && rm /tmp/FiraCode.zip \
    && fc-cache -f -v