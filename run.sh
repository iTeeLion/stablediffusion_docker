git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /opt/sd/sd

chown -R sd:sd /opt/sd/sd && echo 'venv_dir=./venv' > ./sd/webui-user.sh

install_dir=./sd

./sd/webui.sh -f can_run_as_root --exit --skip-torch-cuda-test

VIRTUAL_ENV=/sd/venv

PATH="$VIRTUAL_ENV/bin:$PATH"
