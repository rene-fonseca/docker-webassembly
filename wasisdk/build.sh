#!/bin/bash

echo Building image for WASI SDK

VERSION=8.0

rm -rf wasi-sdk-8.0-linux.tar.gz
wget -q https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-8/wasi-sdk-8.0-linux.tar.gz

# --build-arg TAG=$TAG
# renefonseca/wasisdk:$VERSION
docker build --no-cache -t renefonseca/wasisdk:latest .
docker image tag renefonseca/wasisdk:latest renefonseca/wasisdk:8.0
