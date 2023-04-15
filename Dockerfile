# Use the nixos/nix:latest image
FROM nixos/nix:latest

# Set a working directory inside the container
WORKDIR /plurigrid

# Copy the contents of the current repository into the /plurigrid directory of the container
COPY . /plurigrid

# Install Nix and Poetry dependencies within the Nix shell environment
RUN nix-shell --run " \
    poetry config virtualenvs.create false && \
    poetry install --no-dev --no-interaction --no-ansi \
    "

# Copy the entrypoint.sh script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
