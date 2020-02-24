# Source https://github.com/rene-fonseca/docker-webassembly

FROM ubuntu:18.04 as build

COPY wasmtime-x86_64-linux/wasmtime wasmtime-x86_64-linux/wasm2obj /tmp/usr/bin/
COPY hello register-webassembly.sh /tmp/usr/local/bin/
# COPY webassembly /usr/local/share/webassembly/

FROM ubuntu:18.04

COPY --from=build /tmp/usr/ /usr/
