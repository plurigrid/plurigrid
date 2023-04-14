FROM nixos/nix:latest

# Set a working directory inside the container
WORKDIR /plurigrid

# Copy the contents of the current repository into the /plurigrid directory of the container
COPY . /plurigrid
