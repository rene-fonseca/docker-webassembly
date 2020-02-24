# Wasmtime Docker Image

This image provides the wasmtime engine ready for use and is based on Ubuntu 18.04. wasmtime allows you to run WebAssembly modules built for WASI (ie. WebAssembly System Interface) directly from the command line. Please note that only WebAssembly modules built specifically for WASI are supported (e.g. generated using WASI SDK tool chain). WebAssembly modules built for other environments like the browser are NOT supported (e.g. built with Emscripten).

You can learn more about wasmtime at https://wasmtime.dev/. And WASI at https://wasi.dev/.

If you like where WebAssembly is heading; you can consider following Bytecode Alliance (https://bytecodealliance.org/).

The WebAssembly engine and WASI together provide a way to support many different platforms with a single shared executable without a major performance impact and at the same time provide a high level of security due to the separation of the runtime from the host system.

wasmtime and WASI are both very much in development so you can experience some issues.

The image is hosted at dockerhub (https://hub.docker.com/repository/docker/renefonseca/wasmtime).

## How to Build

```
./build.sh
```

This should build *renefonseca/wasmtime:VERSION* and *renefonseca/wasmtime:latest*.

## Usage

The container includes a simple *hello* example for testing:

```
docker run renefonseca/wasmtime:latest wasmtime /usr/local/bin/hello
```

If everything works as expected you will get the output:
```
Hello from WASI (WebAssembly System Interface).
````

Run in shell:

```
docker run -it renefonseca/wasmtime:latest bash
wasmtime `which hello`
```

You can run WebAssembly modules directly by registering the WebAssembly binary format on the host. The registration uses the binfmt subsystem. Note that registration requires privileged mode:
```
docker run --privileged renefonseca/wasmtime:latest register-webassembly.sh set
```

Once the WebAssembly format has been registered you can run WebAssembly modules directly. Make sure the file has *chmod +x* set.
```
docker run renefonseca/wasmtime:latest hello
```

You can remove the WebAssembly registration again using this command:
```
docker run --privileged renefonseca/wasmtime:latest register-webassembly.sh clear
```

Have fun.
