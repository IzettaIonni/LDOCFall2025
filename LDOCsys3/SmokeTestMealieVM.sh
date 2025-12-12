#!/bin/bash

set -e

# Check python3 version is 3.10
if ! python3 --version | grep -q "python"; then
    echo "python is not installed"
    exit 1
fi

# Check UFW is active
if ! sudo ufw status | grep -q "Status: active"; then
    echo "ufw is not active"
    exit 1
fi

# Check if SSH is allowed in ufw status
if ! sudo ufw status | grep -q "22/tcp.*ALLOW"; then
    echo "SSH is not allowed through ufw"
    exit 1
fi

# Check if port 9925/tcp is allowed in ufw status
if ! sudo ufw status | grep -q "9925/tcp.*ALLOW"; then
    echo "Port 9925/tcp is not allowed through ufw"
    exit 1
fi

echo "All checks passed."
exit 0