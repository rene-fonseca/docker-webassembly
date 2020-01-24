# Source https://github.com/rene-fonseca/docker-webassembly

FROM renefonseca/wasmtime:0.8.0

COPY wasi-sdk-8.0-linux.tar.gz /tmp/

RUN tar xf /tmp/wasi-sdk-*-linux.tar.gz -C / \
  && rm -rf /tmp/wasi-sdk-*-linux.tar.gz \
  && apt-get update -y \
  && apt-get install -y git make cmake \
  && rm -rf /var/lib/apt/lists/*

# overwrite header due to signal prototype issue
COPY csignal /wasi-sdk-8.0/share/wasi-sysroot/include/c++/v1/csignal
