#!/bin/bash

set -o errexit

trap 'echo "Error with Dockerfile: $file"' ERR


# We used to use docker.io/alire
file=$1; shift
registry=ghcr.io/alire-project

echo
echo BUILDING $file...
echo
docker build --pull -t "${registry}/docker/gnat:${file##*.}" -f $file "$@" .
echo DONE $file
