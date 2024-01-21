FROM public.ecr.aws/lts/ubuntu:22.04

RUN apt-get update \
    && apt-get install -y \
    openssh-server \
    jq \
    unzip \
    curl \
    vim \
    git \
    netcat \
    mktorrent \
    ncdu \
    tree \
    ffmpeg \
    fd-find \
    sudo \
    && ln -s /usr/bin/fdfind /usr/local/bin/fd \
    && rm -rf /var/lib/apt/lists/* \
    && rm /etc/ssh/*key*

COPY ./images/ssh/sshd_config /etc/ssh/sshd_config
COPY ./images/ssh/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
