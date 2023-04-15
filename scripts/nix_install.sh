#!/bin/bash

# Check if Nix is installed
if ! command -v nix --help >/dev/null 2>&1; then
  # Delete problematic backup files for bash and zsh if they exist
  if [ -f "/etc/bash.bashrc.backup-before-nix" ]; then
    sudo rm -f /etc/bash.bashrc.backup-before-nix
  fi

  if [ -f "/etc/bashrc.backup-before-nix" ]; then
    sudo rm -f /etc/bashrc.backup-before-nix
  fi

  if [ -f "/etc/zshrc.backup-before-nix" ]; then
    sudo rm -f /etc/zshrc.backup-before-nix
  fi

  # Install Nix for macOS
  echo "Error: Nix package manager is not installed. Installing Nix for macOS..."
  sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
else
  echo "Nix package manager is already installed."
fi

echo "Starting poetry shell..."
poetry install

echo "Starting nix-shell..."
nix-shell
