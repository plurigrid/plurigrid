#!/bin/sh

# Check if OPENAI_API_KEY is set, if not, prompt the user for input
if [ -z "$OPENAI_API_KEY" ]; then
    echo "Please enter your OPENAI_API_KEY:"
    read OPENAI_API_KEY
    export OPENAI_API_KEY
else
    echo "OPENAI_API_KEY is already set."
fi

# Check if PINECONE_API_KEY is set, if not, prompt the user for input
if [ -z "$PINECONE_API_KEY" ]; then
    echo "Please enter your PINECONE_API_KEY:"
    read PINECONE_API_KEY
    export PINECONE_API_KEY
else
    echo "PINECONE_API_KEY is already set."
fi

# Run the command within a pure Nix shell environment, keeping the specified environment variables
exec nix-shell --pure --keep OPENAI_API_KEY --keep PINECONE_API_KEY --run " \
    cd /plurigrid && poetry run python3 plurigrid/agent/agents/plurigrid.py \
    "
