# Start from a stable Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

# Install essential development tools, utilities, and Zsh
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    wget \
    zsh \
    fzf \
    unzip \
    # For GitHub CLI
    gpg \
    && rm -rf /var/lib/apt/lists/*

# Install a Nerd Font (Fira Code) required for modern prompts
RUN mkdir -p /usr/local/share/fonts/FiraCode \
    && wget -O /tmp/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip \
    && unzip /tmp/FiraCode.zip -d /usr/local/share/fonts/FiraCode \
    && rm /tmp/FiraCode.zip \
    && fc-cache -f -v

# Create a non-root user 'vscode' with sudo privileges
RUN useradd -m -s /bin/zsh -G sudo vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the new user
USER vscode
WORKDIR /home/vscode

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Starship prompt
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# Install Zsh plugins (autosuggestions and syntax highlighting)
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy the Zsh setup script into the container and execute it
COPY --chown=vscode:vscode scripts/setup-zsh.sh /tmp/setup-zsh.sh
RUN /tmp/setup-zsh.sh

# Set the default command to Zsh
CMD ["zsh"]
