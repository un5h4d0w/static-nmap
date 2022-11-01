#!/bin/bash
set -e

nmap_version="7.93"

# container_version="ubuntu-18.04-bionic"
container_version="debian-11-bullseye"

echo "[+] Preparing directories..."
mkdir -p output
mkdir -p downloads

echo "[+] Downloading nmap ${nmap_version}..."
[ -f "downloads/nmap-${nmap_version}.tar.bz2" ] || wget -O "downloads/nmap-${nmap_version}.tar.bz2" "https://nmap.org/dist/nmap-${nmap_version}.tar.bz2"
docker build -t "nmap-builcontainer-${container_version}" -f "Dockerfile-${container_version}" --build-arg nmap_version="${nmap_version}" .
docker run --rm -v "$(pwd)/output:/output" "nmap-builcontainer-${container_version}" cp "/nmap.tar" "/output/nmap-${container_version}.tar"
