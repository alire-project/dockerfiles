#!/bin/bash

set -o errexit

trap 'echo "Error with Dockerfile: $file"' ERR


# We used to use docker.io/alire
file=$1; shift
registry=ghcr.io/alire-project

echo
echo RUNNING $file...
echo
docker run "$@" -it "${registry}/docker/gnat:${file##*.}"
echo DONE $file
