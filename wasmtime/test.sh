#!/bin/bash

echo Run 'wasmtime /usr/bin/hello'
docker run renefonseca/wasmtime:${TAG} wasmtime /usr/bin/hello

echo Run 'hello' using binfmt
docker run --privileged renefonseca/wasmtime:${TAG} register-webassembly.sh set
docker run renefonseca/wasmtime:${TAG} hello
