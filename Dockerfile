FROM nvidia/cuda:11.7.1-base-ubuntu22.04

ARG CLI_ARGS

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
    && apt-get install -y wget bc git python3 python3-pip python3-venv google-perftools libgl1 libglib2.0-0 libcairo2-dev pkg-config

RUN useradd -m -U sd

RUN mkdir /opt/sd && chown -R sd:sd /opt/sd

WORKDIR /opt/sd

USER sd

RUN chown -R sd:sd /opt/sd

RUN wget https://raw.githubusercontent.com/iTeeLion/stablediffusion_docker/main/run.sh?v=2 -O run.sh && chmod +x ./run.sh

CMD ./run.sh $CLI_ARGS
