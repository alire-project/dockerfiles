#!/bin/bash

set -o errexit

trap 'echo "Error with Dockerfile: $file"' ERR


# We used to use docker.io/alire
registry=${1:-ghcr.io/alire-project}

for file in Dockerfile.*; do
    echo
    echo BUILDING $file...
    echo
    docker build -q --pull -t "${registry}/docker/gnat:${file##*.}" -f $file .
    echo DONE $file
done
