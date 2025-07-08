#!/bin/bash

set -o errexit

# We used to use docker.io/alire
registry=ghcr.io/alire-project
file=$1

docker login ghcr.io

(
    trap 'echo "Error with Dockerfile: $file"' ERR
    echo
    echo PULLING $file...
    docker pull ${registry}/docker/gnat:${file##*.}
)
