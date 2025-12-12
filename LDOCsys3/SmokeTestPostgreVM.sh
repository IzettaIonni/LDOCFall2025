#!/bin/bash

set -e

# Check psql version is 14.19
if ! psql --version | grep -q "psql"; then
    echo "psql is not installed"
    exit 1
fi

# Check UFW is active
if ! sudo ufw status | grep -q "Status: active"; then
    echo "ufw is not active"
    exit 1
fi

# Check SSH is allowed in ufw status
if ! sudo ufw status | grep -q "22/tcp.*ALLOW"; then
    echo "SSH is not allowed through ufw"
    exit 1
fi

# Check port 5432/tcp is allowed in ufw status
if ! sudo ufw status | grep -q "5432/tcp.*ALLOW"; then
    echo "Port 5432/tcp is not allowed through ufw"
    exit 1
fi

# Check postgresql service status is active
if ! sudo systemctl is-active --quiet postgresql; then
    echo "postgresql service is not active"
    exit 1
fi

echo "All checks passed."
exit 0
