#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <service-base-name>"
  echo "Example: $0 mymealie"
  exit 1
fi

SERVICE_NAME=$1

echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "Enabling $SERVICE_NAME.service..."
sudo systemctl enable "${SERVICE_NAME}.service"

echo "Starting $SERVICE_NAME.service..."
sudo systemctl start "${SERVICE_NAME}.service"

echo "Status of $SERVICE_NAME.service:"
sudo systemctl status "${SERVICE_NAME}.service" --no-pager