#!/bin/bash

# This script configures the .zshrc file for the vscode user

ZSHRC_FILE="/home/vscode/.zshrc"

# Set the Zsh theme to be blank, as Starship will handle the prompt
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME=""/g' $ZSHRC_FILE

# Define the list of plugins to enable
PLUGINS=(
    git
    docker
    docker-compose
    fzf
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Format the plugins list for the .zshrc file
PLUGIN_STRING="plugins=($(echo "${PLUGINS[@]}"))"

# Replace the existing plugins line with our new list
sed -i "s/plugins=(git)/$PLUGIN_STRING/g" $ZSHRC_FILE

# Add the Starship initialization command to the end of the .zshrc file
echo '' >> $ZSHRC_FILE
echo '# Initialize Starship Prompt' >> $ZSHRC_FILE
echo 'eval "$(starship init zsh)"' >> $ZSHRC_FILE

echo "Zsh configuration complete."
