#!/bin/bash

TAG=`curl -s https://api.github.com/repos/bytecodealliance/wasmtime/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^\"]+)".*/\1/'`
echo Building image for Wasmtime $TAG

if [[ "$TAG" =~ ^(.*)([0-9]+\.[0-9]+\.[0-9]+)$ ]]; then
  VERSION=${BASH_REMATCH[2]}
else
  echo "Unsupported version."
  exit 1
fi

rm -rf wasmtime-*x86_64-linux*
curl -s https://api.github.com/repos/bytecodealliance/wasmtime/releases/latest | grep "browser_download_url.*wasmtime-$TAG-x86_64-linux.tar.xz" | cut -d : -f 2,3 | tr -d \" | wget -qi -
tar xf wasmtime-$TAG-x86_64-linux.tar.xz
mv wasmtime-$TAG-x86_64-linux wasmtime-x86_64-linux

# --build-arg TAG=$TAG
docker build --no-cache -t renefonseca/wasmtime:$VERSION -t renefonseca/wasmtime:latest .
