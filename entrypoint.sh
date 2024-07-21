#!/bin/bash

cd /opt/sd

if [ ! -d /opt/sd/webui/venv ]; then
    git config --global --add safe.directory /opt/sd
    git init
    git pull https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
    /opt/sd/webui.sh --skip-torch-cuda-test --exit
    pip3 install --upgrade pip && pip3 install packaging numexpr
fi

python3 launch.py --listen $1

