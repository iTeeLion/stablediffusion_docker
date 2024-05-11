#!/bin/bash

cd /opt/sd

if [ ! -d /opt/sd/webui/venv ]; then
    git init
    git pull https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
    ./webui.sh --skip-torch-cuda-test --exit
    pip3 install --upgrade pip && pip install packaging numexpr
fi

python3 launch.py --listen $1

