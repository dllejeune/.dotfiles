#!/bin/sh

apt-get -y install \
    cmake  \
    tmux   \
    neovim \
    zsh    \
    git    \
    python3.8

ln -s /usr/bin/python3 ~/bin/python

./install
