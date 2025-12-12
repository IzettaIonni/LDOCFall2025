#!/bin/bash

# Usage: ./publish_image.sh <image-name> <tag> <dockerhub-username> [podman|docker]

IMAGE_NAME=$1
TAG=$2
USERNAME=$3
COMMAND=${4:-podman}

if [[ -z "$IMAGE_NAME" || -z "$TAG" || -z "$USERNAME" ]]; then
  echo "Usage: $0 <image-name> <tag> <dockerhub-username> [podman|docker]"
  exit 1
fi

FULL_IMAGE_NAME="docker.io/${USERNAME}/${IMAGE_NAME}:${TAG}"

echo "Building image ${FULL_IMAGE_NAME} using ${COMMAND}..."
${COMMAND} build -t ${FULL_IMAGE_NAME} .

echo "Logging into Docker Hub..."
${COMMAND} login docker.io

echo "Pushing image ${FULL_IMAGE_NAME}..."
${COMMAND} push ${FULL_IMAGE_NAME}

echo "Image pushed successfully: ${FULL_IMAGE_NAME}"
