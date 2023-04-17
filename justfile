default_mode := "gradio"

play mode=default_mode: shell
    poetry run python3 -m plurigrid.agent --agent play_coplay --mode "{{mode}}"

summon prompt mode=default_mode:
    poetry run python3 -m plurigrid.agent --agent digital_twin --prompt "{{prompt}}" --mode "{{mode}}"

ontology knowledge-base mode="repl":
    python3 -m plurigrid.agent --agent ontology --mode "{{mode}}" --path "{{knowledge-base}}"

docker:
    docker run -it --platform=linux/amd64 -v "$(pwd)":/plurigrid nixos/nix bash

run:
	nix-channel --update
	nix-shell --run "poetry update"

shell: run
	nix-shell --run "poetry shell"
