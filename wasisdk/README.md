# WASI-SDK Tool-Chain Docker Image

This image provides the WASI-SDK tool chain ready for building WASI WebAssembly modules for running with wasmtime which is also included (see repo wasmtime). WASI (WebAssembly System Interface) provides an API layer (mostly POSIX compatible) to allow system integration.

You can learn more about wasmtime at https://wasmtime.dev/. And WASI at https://wasi.dev/.

If you like where WebAssembly is heading; you can consider following Bytecode Alliance (https://bytecodealliance.org/).

The WebAssembly engine and WASI together provide a way to support many different platforms with a single shared executable without a major performance impact and at the same time provide a high level of security due to the separation of the runtime from the host system.

wasmtime and WASI are both very much in development so you can experience some issues.

The image also includes the common tools *git*, *make* and *cmake*.

The image is hosted at dockerhub (https://hub.docker.com/repository/docker/renefonseca/wasisdk).

## How to Build

```
./build.sh
```

This should build *renefonseca/wasisdk:VERSION* and *renefonseca/wasisdk:latest*.

## Usage

You can now enter the sheel ready for building with WASI:
```
docker run -it renefonseca/wasisdk:latest bash
```

The WASI-SDK tool chain is available from the root.

If you use *cmake* you should build your project using commands like below:
```
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=/wasi-sdk-8.0/share/cmake/wasi-sdk.cmake -DWASI_SDK_PREFIX=/wasi-sdk-8.0
cmake --build . --target install
```

You need to run the generated executables using *wasmtime*. However, some projects may not have been setup to handle this (e.g. for running *ctest*) in which case you can register WebAssembly binary format and that way run WebAssembly modules directly. The registration uses the binfmt subsystem. Note that registration requires privileged mode:
```
docker run --privileged renefonseca/wasisdk:latest register-webassembly.sh set
```

Once the WebAssembly format has been registered you can run WebAssembly modules directly. Make sure the file has *chmod +x* set.
```
docker run renefonseca/wasisdk:latest hello
```

You can remove the WebAssembly registration again using this command:
```
docker run --privileged renefonseca/wasisdk:latest register-webassembly.sh clear
```
