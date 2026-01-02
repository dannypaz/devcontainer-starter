#!/bin/zsh

set -e

echo "Prepare environment"
CURRENT_USER=${USER-:$(whoami)}
sudo chown -R $CURRENT_USER ~/.cache

# Specific perms to allow uv to create venv to help with vscode environment# Local settings
echo "Setting perms for .venv"
mkdir -p /workspace/.venv
sudo chown -R $CURRENT_USER /workspace/.venv

echo "Setting perms for node_modules"
mkdir -p /workspace/node_modules

if [ "$(stat -c '%U' /workspace/node_modules)" != "$CURRENT_USER" ]; then
    sudo chown -R $CURRENT_USER /workspace/node_modules
fi

# Always update and copy the container zshrc file
cp /workspace/.devcontainer/.zshrc.container ~/.zshrc.container

if ! [ -f ~/.zshrc ]; then
    touch ~/.zshrc
fi

if ! grep -Fxq "source ~/.zshrc.container" ~/.zshrc; then
    echo "Adding container command line prompt"
    echo "source ~/.zshrc.container" >> ~/.zshrc
fi

# ZSH history setup
sudo mkdir -p /devprofile
sudo touch /devprofile/.zsh_history
sudo chown -R ${USER} /devprofile

# Dep setup
uv sync || exit 0
