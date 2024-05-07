FROM debian

RUN apt update && apt install -y gpg curl wget git python3 python3-venv libgl1 libglib2.0-0

RUN curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | \
    gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg | \
    curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

RUN apt update && apt install -y nvidia-container-toolkit

RUN useradd -U sd

RUN mkdir -p /opt/sd && chmod -R 775 /opt/sd && chown -R sd:sd /opt/sd

WORKDIR /opt/sd

RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh

RUN chsh -s /bin/bash sd

RUN ./webui.sh
