# Source https://github.com/rene-fonseca/docker-webassembly

FROM ubuntu:18.04

#RUN apt-get update -y \
#  && apt-get install -y binfmt-support \
#  && rm -rf /var/lib/apt/lists/*
COPY wasmtime-x86_64-linux/wasmtime wasmtime-x86_64-linux/wasm2obj hello register-webassembly.sh /tmp/
# webassembly
RUN mv /tmp/wasm2obj /usr/bin/ \
  && mv /tmp/wasmtime /usr/bin/ \
  && mv /tmp/register-webassembly.sh /usr/local/bin/ \
  && mv /tmp/hello /usr/local/bin/

# && mkdir -p /usr/local/share/webassembly/
# && mv /tmp/webassembly /usr/local/share/webassembly/
# && update-binfmts --import /usr/local/share/webassembly/webassembly
