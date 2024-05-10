git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

chown -R sd:sd /opt/sd/stable-diffusion-webui

cd ./stable-diffusion-webui

echo 'venv_dir=./venv' > ./webui-user.sh

install_dir=./

./webui.sh -f can_run_as_root --exit --skip-torch-cuda-test

VIRTUAL_ENV=/venv

PATH="$VIRTUAL_ENV/bin:$PATH"
