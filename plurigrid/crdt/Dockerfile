# Use the nixos/nix:latest image
FROM nixos/nix:latest

# Set a working directory inside the container
WORKDIR /crdt

# Copy the contents of the current repository into the /plurigrid directory of the container
COPY . /crdt

# Install Nix and Poetry dependencies within the Nix shell environment
RUN nix-shell --run " \
    poetry config virtualenvs.create false && \
    poetry install --no-dev --no-interaction --no-ansi \
    "

# Install y-py within the Nix shell environment
RUN nix-shell --run " \
    echo 'Some time might vary depending on your internet) && \
    poetry add y-py \
    "

# Copy the entrypoint.sh script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
