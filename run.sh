#!/bin/bash

if [ ! -d /opt/sd/webui/venv ]; then
  git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
  sudo -u sd cp -r ./stable-diffusion-webui/* ./webui
  cd ./webui
  sudo -u sd ./webui.sh --skip-torch-cuda-test --exit
fi

cd /opt/sd/webui

sudo -u sd python3 launch.py --listen $1
