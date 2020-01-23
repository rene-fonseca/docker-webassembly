# Wasmtime Docker Image

This image provides wasmtime and is based on Ubuntu 18.04.

The image is hosted at dockerhub (https://hub.docker.com/repository/docker/renefonseca/wasmtime).

## How to Build

```
./build.sh
```

This should build *renefonseca/wasmtime:VERSION* and *renefonseca/wasmtime:latest*.

## Test

```
docker run -it renefonseca/wasmtime:latest bash
wasmtime `which hello`
```
