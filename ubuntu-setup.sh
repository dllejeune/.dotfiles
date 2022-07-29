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
PATH="${HOME}/bin:${PATH}"
ln -s /usr/bin/python3.9 ${HOME}/bin/python

git submodule update --init --recursive
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

./install

