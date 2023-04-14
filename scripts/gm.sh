#!/bin/bash

# Set your GitHub repository URL and Docker image name here
GITHUB_REPO_URL="https://github.com/plurigrid/plurigrid"
DOCKER_IMAGE_NAME="plurigrid:latest"

# Clone the GitHub repository
git clone "$GITHUB_REPO_URL"
cd plurigrid

# Pull the Docker image from the GitHub Container Registry
docker pull ghcr.io/plurigrid/"$DOCKER_IMAGE_NAME"

# Run the Docker image
docker run -it --rm --platform=linux/amd64 -v "$(pwd)":/plurigrid "${DOCKER_IMAGE_NAME}" bash -c '
nix-shell
cd /plurigrid
poetry update
poetry shell
python plurigrid.py
'

docker run --platform=linux/amd64 plurigrid:test2 bash -c '
    nix-shell --run "\
        cd /plurigrid && \
        poetry install && \
        poetry run python3 plurigrid/plurigrid.py"
'
