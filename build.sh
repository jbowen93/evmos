#!/bin/sh

WORKDIR=$PWD

# Get ethermint
git clone git@github.com:celestiaorg/optimint.git
cd optimint
git checkout 939aa77
rm -rf .git
go mod tidy -compat=1.17
cd $WORKDIR

# Get Optimint
git clone git@github.com:jbowen93/ethermint.git
cd ethermint
git checkout jbowen93-optimint
rm -rf .git
go mod tidy -compat=1.17
cd $WORKDIR

# Cleanup
go mod tidy -compat=1.17

# Docker build
docker buildx build --platform linux/arm64 -f docker/debug.Dockerfile -t ghcr.io/jbowen93/evmos:testing-debug-arm64 .