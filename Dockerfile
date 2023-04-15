# Use the nixos/nix:latest image
FROM nixos/nix:latest

# Set a working directory inside the container
WORKDIR /plurigrid
RUN pip install -r requirements.txt

# Copy the entrypoint.sh script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copy the contents of the current repository into the /plurigrid directory of the container
COPY . /plurigrid

ENTRYPOINT ["/entrypoint.sh"]
>>>>>>> main
