#!/bin/bash

# Prompt the user to enter API keys
echo "Please enter your OpenAI API key:"
read OPENAI_API_KEY

echo "Please enter your Pinecone API key:"
read PINECONE_API_KEY

docker run -it --platform=linux/amd64 -v "$(pwd)":/plurigrid nixos/nix bash -c "
  cd /plurigrid && \
  nix-shell --run \"
    cd /plurigrid && \
    export OPENAI_API_KEY=$OPENAI_API_KEY && \
    export PINECONE_API_KEY=$PINECONE_API_KEY && \
    poetry update && \
    poetry run python plurigrid/agent/agents/plurigrid.py\""
