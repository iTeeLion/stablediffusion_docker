#!/bin/bash

if [ ! -d /opt/sd/webui/venv ]; then
  git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
  mv -f ./stable-diffusion-webui/* ./webui
  rm -rf ./stable-diffusion-webui/
  cd ./webui
  ./webui.sh --skip-torch-cuda-test --exit
fi

cd /opt/sd/webui

python3 launch.py --listen $1
