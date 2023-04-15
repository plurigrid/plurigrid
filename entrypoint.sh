#!/bin/sh

# Run plurigrid.py within nix-shell
nix-shell --run "cd /plurigrid && poetry run python3 plurigrid/agent/agents/plurigrid.py"
