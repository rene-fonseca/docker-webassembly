#!/bin/bash

# https://github.com/rene-fonseca/docker-webassembly

webassembly_set_binfmts() {
  # package webassembly
  # type magic
  # offset 0
  # magic \x00\x61\x73\x6d\x01\x00\x00\x00
  # mask \xff\xff\xff\xff\xff\xff\xff\xff
  # interpreter /usr/bin/wasmtime

  echo ":webassembly:M::\x00\x61\x73\x6d\x01\x00\x00\x00:\xff\xff\xff\xff\xff\xff\xff\xff:/usr/bin/wasmtime:" > /proc/sys/fs/binfmt_misc/register
}

webassembly_clear_binfmts() {
  if [ ! -f /proc/sys/fs/binfmt_misc/webassembly ]; then
    echo "WebAssembly is not registered."
    exit 1
  fi
  echo -1 > /proc/sys/fs/binfmt_misc/webassembly
}

# get access to binfmt_misc
if [ ! -f /proc/sys/fs/binfmt_misc/register ]; then
  if ! mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc ; then
    echo "Error: Cannot modify WebAssembly format registration. Check that you are running docker in --privileged mode."
    exit 1
  fi
fi

if [ x"$1" == x"set" ]; then
  webassembly_set_binfmts 
elif [ x"$1" == x"clear" ]; then
  webassembly_clear_binfmts
else
  echo "Error: Invalid argument. Use either 'set' or 'clear'."
  exit 1
fi
