#!/bin/sh

# Install Poetry dependencies and run plurigrid.py within the context of nix-shell
nix-shell --run "cd /plurigrid && poetry install && poetry run python3 plurigrid/agent/agents/plurigrid.py"
