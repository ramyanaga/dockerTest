#!/bin/bash

# Description:
# Builds the compute api app
#
# Usage:
# ./dockerize.sh <VERSION TAG>

if [ "$#" -ne 1 ]; then
    echo "Usage: ./dockerize.sh <VERSION TAG>"
    exit 1
fi

TAG=$1
REGISTRY_URL="registry.git.nasdaq.com/akbans/securemultiparty/container_registry"

echo "---DOCKER BUILD---"
docker build -t nasdaq/compute-seal:$TAG .

echo "---DOCKER TAG---"
docker tag nasdaq/compute-postgres-db:$TAG $REGISTRY_URL/compute-seal:$TAG

echo "---DOCKER PUSH---"
docker push $REGISTRY_URL/compute-seal:$TAG