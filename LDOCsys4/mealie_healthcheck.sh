#!/usr/bin/env bash

CONTAINER_NAME="mymealie" 

if podman ps | grep -q "$CONTAINER_NAME" && podman ps | grep "$CONTAINER_NAME" | grep -q "Up"; then
    echo "✅ Container '$CONTAINER_NAME' is running (Up)"
    exit 0
else
    echo "❌ Container '$CONTAINER_NAME' is not running"
    exit 1
fi