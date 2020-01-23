#!/bin/bash

docker build --no-cache -f wasmtime-0.8.0.docker -t renefonseca/wasmtime:0.8.0 -t renefonseca/wasmtime:latest .
