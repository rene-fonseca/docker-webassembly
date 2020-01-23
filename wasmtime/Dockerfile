# Source https://github.com/rene-fonseca/docker-webassembly

FROM ubuntu:18.04

#RUN apt-get update -y \
#  && apt-get install -y binfmt-support \
#  && rm -rf /var/lib/apt/lists/*
COPY wasmtime-v0.8.0-x86_64-linux.tar.gz hello register-webassembly.sh /tmp/
# webassembly
RUN tar xzf /tmp/wasmtime-v0.8.0-x86_64-linux.tar.gz -C /tmp/ \
  && mv /tmp/wasmtime-v0.8.0-x86_64-linux/wasm2obj /usr/bin/ \
  && mv /tmp/wasmtime-v0.8.0-x86_64-linux/wasmtime /usr/bin/ \
  && mv /tmp/register-webassembly.sh /usr/local/bin/ \
  && mv /tmp/hello /usr/local/bin/ \
  && rm -rf /tmp/wasmtime-v0.8.0-x86_64-linux.tar.gz /tmp/wasmtime-v0.8.0-x86_64-linux

# && mkdir -p /usr/local/share/webassembly/
# && mv /tmp/webassembly /usr/local/share/webassembly/
# && update-binfmts --import /usr/local/share/webassembly/webassembly
