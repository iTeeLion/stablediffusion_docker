FROM nvidia/cuda:11.7.1-base-ubuntu22.04

ARG UID
ARG GID
ARG CLI_ARGS

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
    && apt-get install -y sudo wget bc git python3 python3-pip python3-venv google-perftools libgl1 libglib2.0-0 libcairo2-dev pkg-config

RUN useradd -m -U sd \
    && usermod -u $UID sd \
    && groupmod -g $GID sd

RUN mkdir -p /opt/sd/webui \
    && chown -R sd:sd /opt/sd

WORKDIR /opt/sd

USER sd

RUN wget https://raw.githubusercontent.com/iTeeLion/stablediffusion_docker/main/entrypoint.sh && chmod +x ./entrypoint.sh

CMD ./entrypoint.sh $CLI_ARGS
