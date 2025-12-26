#!/bin/bash

if [ -z $1 -o -z $2 ]; then 
    echo "usage: <path> <image>"
    exit 1
fi

cd $1
path="$(pwd)"
image="$2"



sudo podman info && sudo podman create \
-- name kc_container \
-v "$path:/opt/keycloak/data" \
-e "KC_BOOTSTRAP_ADMIN_USERNAME=admin" \
-e "KC_BOOTSTRAP_ADMIN_PASSWORD=admin" \
"$image" start-dev