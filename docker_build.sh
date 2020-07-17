#!/bin/bash

# Description:
# Builds the compute api app
#
# Usage:
# ./docker_build.sh <VERSION TAG>

if [ "$#" -ne 1 ]; then
    echo "Usage: ./docker_build.sh <VERSION TAG>"
    exit 1
fi

TAG=$1

echo "---DOCKER BUILD---"
docker build --tag compute-demo .
echo "---DOCKER RUN---"
docker run --name compute-demo -p 5001:5001 compute-demo