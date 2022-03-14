#!/bin/bash

DOCKER_TAG=$1
arch=$(uname -p)

WORKDIR=$PWD
rm -rf ethermint optimint

# Get Optimint
git clone git@github.com:celestiaorg/optimint.git -q
echo "cloned optimint"
cd optimint
git checkout jbowen93/v0.1.1-coinbase
echo "checked out jbowen93/v0.1.1-coinbase branch"
# git checkout tzdybal/load_commit
# echo "checked out tzdybal/load_commit branch"
rm -rf .git
go mod tidy -compat=1.17 -e
echo "finished tidying optimint"
cd $WORKDIR

# Get ethermint
git clone git@github.com:jbowen93/ethermint.git -q
echo "cloned ethermint"
cd ethermint
# git checkout jbowen93-optimint -q
# echo "checked out jbowen93-optimint branch"
git checkout test-patch -q
echo "checked out test-patch branch"
rm -rf .git
go mod edit -replace=github.com/celestiaorg/optimint=../optimint
go mod tidy -compat=1.17 -e
echo "finished tidying ethermint"
cd $WORKDIR

# Cleanup
go mod edit -replace=github.com/celestiaorg/optimint=./optimint
go mod edit -replace=github.com/tharsis/ethermint=./ethermint
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
