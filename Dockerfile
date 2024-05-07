FROM debian

RUN apt update && apt install -y gpg wget git python3 python3-venv libgl1 libglib2.0-0

RUN useradd -U sd

RUN mkdir -p /opt/sd && chmod -R 775 /opt/sd && chown -R sd:sd /opt/sd

WORKDIR /opt/sd

RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh

RUN chsh -s /bin/bash ollama

RUN webui.sh
