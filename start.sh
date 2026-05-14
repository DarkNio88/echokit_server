#!/usr/bin/env bash
set -euo pipefail

# Start echokit_server in a detached screen session
SESSION_NAME="echokit_server"
CMD="./target/release/echokit_server"

if [ ! -x "${CMD%% *}" ]; then
	echo "Executable not found or not executable: ${CMD%% *}"
	exit 1
fi

if screen -list | grep -q "\.${SESSION_NAME}[[:space:]]"; then
	echo "Screen session '${SESSION_NAME}' already running"
else
	screen -dmS "${SESSION_NAME}" bash -lc "${CMD}"
	echo "Started screen session '${SESSION_NAME}'"
fi