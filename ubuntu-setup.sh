#!/bin/sh

apt-get -y install \
    cmake  \
    tmux   \
    neovim \
    zsh    \
    git    \
    python3.8

alias python='python3'

./install
