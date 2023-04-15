#!/bin/bash

# Set your GitHub repository URL and Docker image name here
GITHUB_REPO_URL="https://github.com/janitaplurigrid/plurigrid"
DOCKER_IMAGE_NAME="plurigrid:latest"

# Clone the GitHub repository
git clone "$GITHUB_REPO_URL"
cd plurigrid

# Pull the Docker image from the GitHub Container Registry
docker pull ghcr.io/plurigrid/"$DOCKER_IMAGE_NAME"

# Run the Docker image
docker run -it --rm -v "${DOCKER_IMAGE_NAME}"
