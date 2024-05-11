#!/bin/bash

if [ ! -d /opt/sd/webui/venv ]; then
  git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
  cp -r ./stable-diffusion-webui/* ./webui
  cd ./webui
  ./webui.sh --skip-torch-cuda-test --exit
fi

cd /opt/sd/webui

python3 launch.py --listen $1
