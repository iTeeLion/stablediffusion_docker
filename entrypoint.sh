#!/bin/bash

if [ ! -d /opt/sd/webui/venv ]; then
    mkdir -p /opt/sd/_dist && cd /opt/sd/_dist
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
    cp -r /opt/sd/_dist/stable-diffusion-webui/* /opt/sd
    cd /opt/sd
    rm -rf /opt/sd/_dist
    /opt/sd/webui.sh --skip-torch-cuda-test --exit
    pip3 install --upgrade pip && pip3 install packaging numexpr
fi

cd /opt/sd
python3 launch.py --listen $1
