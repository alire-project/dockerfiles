#!/bin/bash

set -o errexit

# We used to use docker.io/alire
registry=${1:-ghcr.io/alire-project}

docker login ghcr.io

for file in Dockerfile.*; do
    (
        trap 'echo "Error with Dockerfile: $file"' ERR
        echo
        echo PUSHING $file...
        docker push ${registry}/docker/gnat:${file##*.}
    )
done