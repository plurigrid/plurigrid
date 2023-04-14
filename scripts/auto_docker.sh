#!/bin/bash

# Check if Nix is installed
if ! command -v nix >/dev/null 2>&1; then
  echo "Error: Nix package manager is not installed. Please install Nix before running this script."
  echo "macOS: run 'sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume'"
  echo "Linux: run 'sh <(curl -L https://nixos.org/nix/install)'"
  exit 1
fi

# Check if jq is already installed
if command -v jq >/dev/null 2>&1; then
  echo "jq is already installed."
else
  # Install jq with Nix
  echo "Installing jq with Nix..."
  nix-env --install jq
fi

# Check if Docker is installed
if ! command -v docker >/dev/null 2>&1; then
    echo "Docker not found. Installing Docker Desktop for macOS..."

    # Set the download URL for Docker Desktop on macOS ARM64
    DOCKER_DOWNLOAD_URL="https://desktop.docker.com/mac/main/arm64/Docker.dmg"

    echo "Downloading Docker Desktop from $DOCKER_DOWNLOAD_URL"

    # Download Docker Desktop dmg file
    curl -Lo ~/Downloads/Docker.dmg "$DOCKER_DOWNLOAD_URL"

    # Mount the dmg file
    hdiutil attach ~/Downloads/Docker.dmg

    # Install Docker.app to /Applications
    sudo cp -R '/Volumes/Docker/Docker.app' /Applications/

    # Unmount and remove the dmg file
    hdiutil detach '/Volumes/Docker'
    rm ~/Downloads/Docker.dmg

    echo "Docker Desktop for macOS successfully installed."
fi

open -a docker

echo "Launching docker..."
echo "Please complete the Docker setup process and press any key to continue once the setup is completed."
read -n 1 -s -r

DOCKER_SETTINGS_FILE="$HOME/Library/Group Containers/group.com.docker/settings.json"

# Ensure Docker is not running
pgrep "Docker" && killall Docker

# Wait for 10 seconds after killing Docker
echo "Waiting for 20 seconds to allow Docker to close properly..."
sleep 20

# Modify the settings file to match the revised default settings
jq '
    .dockerAppLaunchPath = ""
  | .diskFlush = ""
  | .diskQcowCompactAfter = 0
  | .diskQcowKeepErased = 0
  | .useVirtualizationFrameworkRosetta = true
  ' "$DOCKER_SETTINGS_FILE" > "$DOCKER_SETTINGS_FILE.tmp" && mv "$DOCKER_SETTINGS_FILE.tmp" "$DOCKER_SETTINGS_FILE"

echo "Successfully updated the Docker settings. Restarting Docker for the changes to take effect."
open -a Docker
