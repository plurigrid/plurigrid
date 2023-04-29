# To setup Juypter notebook, run the following commands
docker run -it --platform=linux/amd64 -p 8888:8888 -v "$(pwd)":/plurigrid nixos/nix bash -c "cd /plurigrid;nix-shell"
poetry update
poetry shell
jupyter lab --collaborative --allow-root --ip 0.0.0.0
