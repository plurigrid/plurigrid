# Build Process
`docker run -it --platform=linux/amd64 -v "$(pwd)":/plurigrid nixos/nix bash`
`cd plurigrid`
`nix-shell`
`poetry run python plurigrid/crdt/sync.py`
