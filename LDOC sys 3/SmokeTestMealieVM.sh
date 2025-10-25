#!/bin/bash

set -e

# Check python3 version is 3.10
if ! python3 --version | grep -q "Python 3.10"; then
    echo "python3 version is not 3.10"
    exit 1
fi

# Check if venv named mealie_env exists
if [ ! -d "mealie_env" ]; then
    echo "Virtual environment 'mealie_env' does not exist"
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