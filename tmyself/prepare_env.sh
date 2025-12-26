#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: <image>"
fi

sudo podman --version || exit 1
sudo podman info >/dev/null 2>&1 || exit 1

sudo podman image exists $1 || sudo podman pull $1 || exit 1