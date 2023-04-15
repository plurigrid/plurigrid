#!/bin/bash

OPENAI_API_KEY=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
PINECONE_API_KEY=e3f65295-695b-47b3-b004-e59127a7c420

docker run -it --platform=linux/amd64 -v "$(pwd)":/plurigrid nixos/nix bash -c "
  cd /plurigrid && \
  nix-shell --run \"
    cd /plurigrid && \
    export OPENAI_API_KEY=$OPENAI_API_KEY && \
    export PINECONE_API_KEY=$PINECONE_API_KEY && \
    poetry update && \
    poetry run python plurigrid/agent/agents/plurigrid.py\""
