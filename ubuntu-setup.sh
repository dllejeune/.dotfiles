#!/bin/sh

add-apt-repository ppa: deadsnakes / ppa

apt-get -y install \
    cmake  \
    tmux   \
    neovim \
    zsh    \
    git    \
    python3.9

# make that damn dirty snake available
mkdir ${HOME}/bin
PATH="$HOME/bin:$PATH"
ln -s /usr/bin/python3 ~/bin/python

./install
