# static-nmap

Build a static nmap binary that can be dropped on hosts that do not have nmap installed together with its data files.

The nmap binary still depends on libc, therefore, it needs to be built in a similar environment.

The binary is packaged together with the corresponding data files and therefore supports script scans and version scans.

## Preconditions

The following tools need to be installed for building nmap:
* docker
* wget

## Build Instructions

Simply run [build.sh](./build.sh) after uncommenting the `container_version` that should be used. The output will be packaged as `tar` archive and can be found inside the `output` directory and is called `nmap-CONTAINERVERSION.tar`.

## Nmap usage

1. Upload `nmap-CONTAINERVERSION.tar` to a target host
2. Run `tar -xf nmap-CONTAINERVERSION.tar` to unpack
3. Run `NMAPDIR=$(pwd)/nmap-data ./nmap`
