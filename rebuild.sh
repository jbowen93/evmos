#!/bin/bash

DOCKER_TAG=$1
arch=$(uname -p)

# Cleanup
go mod tidy -compat=1.17 -e
echo "finished tidying evmos"

# Docker build
if [ $arch=x86_64 ]
then
    docker buildx build --platform linux/amd64 -f docker/debug.Dockerfile -t ghcr.io/jbowen93/evmos:$DOCKER_TAG .
elif [ $arch=arm ] 
then
    docker buildx build --platform linux/arm64 -f docker/debug.Dockerfile -t ghcr.io/jbowen93/evmos:$DOCKER_TAG .
else
    echo "architecture is not one of x86_64 or arm"
fi
