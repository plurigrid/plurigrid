#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title gm
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ☀️

# Documentation:
# @raycast.description gm!
# @raycast.author Plurigrid

DOCKER_IMAGE_NAME="plurigrid:latest"

# Pull the Docker image from the GitHub Container Registry
# docker pull ghcr.io/plurigrid/"$DOCKER_IMAGE_NAME"

# Run the Docker image
# docker run -it --rm -v "${DOCKER_IMAGE_NAME}"

osascript -e 'tell app "Terminal" to do script "docker run -it --platform linux/amd64 plurigrid:latest"'
