#!/bin/bash

if [ -z $1 ]; then
    echo "usage: <path>"
fi

if [ ! -d $1 ]; then 
    sudo mkdir -p "$1/data"
fi

id kcadmin || sudo useradd kcadmin

sudo chown -R kcadmin:kcadmin "$1/data"
sudo chmod u+wr "$1/data"