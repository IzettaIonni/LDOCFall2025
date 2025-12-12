#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib ufw

sudo systemctl enable postgresql
sudo systemctl start postgresql

sudo ufw allow ssh
sudo ufw allow 5432/tcp

sudo ufw enable
