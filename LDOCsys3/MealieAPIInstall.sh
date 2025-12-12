#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y python3-pip python3-venv python3-dev libssl-dev libffi-dev libpq-dev

python3 -m venv mealie_env

source mealie_env/bin/activate

pip install --upgrade pip
pip install mealieapi

deactivate
