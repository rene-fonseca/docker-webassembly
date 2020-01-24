# Source https://github.com/rene-fonseca/docker-webassembly

FROM renefonseca/wasmtime:0.8.0 as build

COPY wasi-sdk-8.0-linux.tar.gz /tmp/

RUN tar xf /tmp/wasi-sdk-8.0-linux.tar.gz -C /

# overwrite header due to signal prototype issue
COPY csignal /wasi-sdk-8.0/share/wasi-sysroot/include/c++/v1/csignal

FROM renefonseca/wasmtime:0.8.0

COPY --from=build /wasi-sdk-8.0 /wasi-sdk

RUN apt-get update -y \
  && apt-get install -y git make cmake \
  && rm -rf /var/lib/apt/lists/*
