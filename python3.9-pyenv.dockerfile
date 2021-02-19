FROM ubuntu:latest

LABEL maintainer="Igor Oak <igbrch@gmail.com>"

ENV LANG C.UTF-8
ENV HOME "/home/administrador"

RUN apt-get update && apt-get install sudo software-properties-common -y && add-apt-repository ppa:git-core/ppa -y && sudo add-apt-repository ppa:chris-lea/redis-server -y && sudo add-apt-repository ppa:nginx/stable -y

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    ca-certificates \
    openssl \
    arj \
    cabextract \
    curl \
    file-roller \
    git \
    libbz2-dev \
    libffi-dev \
    libfreetype6-dev \
    libjpeg-dev \
    liblcms2-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtiff5-dev \
    libtk8.6 \
    libwebp-dev \
    libxml2-dev \
    llvm \
    make \
    mpack \
    nginx \
    p7zip-full \
    p7zip-rar \
    pgadmin3 \
    rar \
    redis-server \
    sharutils \
    tk8.6 \
    tk8.6-dev \
    unace \
    unrar \
    unzip \
    uudeview \
    wget \
    zip \
    zlib1g-dev \
    xclip \
    libgdal-dev \
    nodejs \
    graphviz \
    libgraphviz-dev \
    pkg-config \
    nano \
    postgresql-client

RUN useradd -p $(openssl passwd -1 password) -m administrador && usermod -aG sudo administrador

COPY --chown=administrador:administrador .bashrc $HOME

USER administrador

WORKDIR $HOME

RUN git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv

RUN . $HOME/.bashrc && pyenv install 3.9.0 && pyenv global 3.9.0 && pyenv rehash

RUN . $HOME/.bashrc && pip3 install -U pip setuptools wheel pipenv django
