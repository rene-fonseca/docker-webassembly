FROM ubuntu:bionic as build

ARG VERSION

RUN apt-get -y update
RUN apt-get -y install git gcc g++ curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"

RUN mkdir /wasmtime && \
  cd /wasmtime && \
  git clone --recurse-submodules https://github.com/bytecodealliance/wasmtime.git && \
  cd wasmtime && \
  git tag && \
  git checkout $VERSION && \
  git submodule update --init --recursive && \
  cargo build --release

COPY hello register-webassembly.sh webassembly /wasmtime/



FROM ubuntu:bionic

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="wasmtime" \
      org.label-schema.description="wasmtime" \
      org.label-schema.url="https://github.com/rene-fonseca/docker-images" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/rene-fonseca/docker-images" \
      org.label-schema.vendor="René Fonseca" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

COPY --from=build ["/wasmtime/wasmtime/target/release/wasmtime", \
  "/wasmtime/wasmtime/target/release/wasm2obj", \
  "/wasmtime/hello", \
  "/wasmtime/register-webassembly.sh", \
  "/usr/bin/"]
