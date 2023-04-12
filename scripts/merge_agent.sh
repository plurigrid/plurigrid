#!/bin/bash

# Check if the required parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <agent_directory> <plurigrid_directory>"
    exit 1
fi

# Set the directories for agent and plurigrid codebases
AGENT_DIR="$1"
PLURIGRID_DIR="$2"

# Create agent directory inside plurigrid if it doesn't exist
mkdir -p "${PLURIGRID_DIR}/plurigrid/agent"

# Copy agent files
cp -R "${AGENT_DIR}/agent"/* "${PLURIGRID_DIR}/plurigrid/agent/"

# Copy agent scripts
cp -R "${AGENT_DIR}/scripts"/* "${PLURIGRID_DIR}/scripts/"

# Merge dependencies from agent pyproject.toml into plurigrid pyproject.toml
python3 << EOF
import toml

agent_toml_file = "${AGENT_DIR}/pyproject.toml"
plurigrid_toml_file = "${PLURIGRID_DIR}/pyproject.toml"

with open(agent_toml_file, 'r') as agent_toml:
    agent_config = toml.load(agent_toml)

with open(plurigrid_toml_file, 'r') as plurigrid_toml:
    plurigrid_config = toml.load(plurigrid_toml)

for dep_type in ['dependencies', 'dev-dependencies']:
    for dependency, version in agent_config['tool']['poetry'][dep_type].items():
        plurigrid_config['tool']['poetry'][dep_type][dependency] = version

with open(plurigrid_toml_file, 'w') as plurigrid_toml:
    toml.dump(plurigrid_config, plurigrid_toml)
EOF

# Update plurigrid poetry.lock using the merged pyproject.toml
cd "${PLURIGRID_DIR}"
poetry lock
cd ..

echo "Integration of agent into plurigrid complete."
