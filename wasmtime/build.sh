#!/bin/bash

echo Building image for wasmtime

if [ "$TAG" == "" ]; then
  echo "TAG not defined."
  exit 1
fi

# --no-cache
docker build --build-arg VCS_REF=`git rev-parse --short HEAD` \
  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
  --build-arg VERSION=${TAG} \
  -t renefonseca/wasmtime:${TAG} .
