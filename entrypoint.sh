#!/bin/bash

set -e

TAURUS_FOLDER_NAME="${INPUT_TAURUS_PROJECT_FOLDER_NAME}"
IFS=' ' read -r -a COMMAND_LINE <<< "${INPUT_TAURUS_COMMAND_LINE}"
BZT_TOKEN="${INPUT_BLAZEMETER_API_TOKEN}"

# Get project from Dockerfile
cp --recursive --force "/github/workspace/${TAURUS_FOLDER_NAME}/" "/tmp/scenario"

cd "/tmp/scenario" || exit 1

if [ -n "${BZT_TOKEN}" ]; then
    COMMAND_LINE+=("-o" "modules.blazemeter.token=${BZT_TOKEN}" "-o" "modules.cloud.token=${BZT_TOKEN}")
fi

echo "Launching Taurus test"
bzt ${COMMAND_LINE[@]}