#!/bin/bash

# Développeur ....: K3rn€l_P4n1K
# Nom ............: ubuntu-setup
# Description ....: Configure un nouveau poste ubuntu pour le dev
# Version ........: 1.0
# Date ...........: Fri Jul 29 21:21:30 CEST 2022
# Dépendances ....: git curl dotbot

# Fonctionnalité .: Installe les dotfiles, nvm, docker, neovim ...
# Intention ......: Simplifier la prise en main d'un nouveau poste de travail
# Remarque .......: N/A


# ===========================
# Copyright 2022 K3rn€l P4n1k
# ===========================
#
# This file is part of phreno-dot-files.
#
# phreno-dot-files is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# phreno-dot-files is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with phreno-dot-files. If not, see <http://www.gnu.org/licenses/>.

# ------------------
# VARIABLES GLOBALES
# ------------------

# Chemin du script
SCRIPT="${0}"

# Nom du script
SCRIPT_NAME="$( basename ${0} )"

# Dossier du script
SCRIPT_DIR="$( dirname ${0} )"

# Fichier de log des erreurs
LOGERR="${SCRIPT_NAME}.err.log"

# ---------
# FONCTIONS
# ---------

# Exécutée lors de la sortie du script (CTRL+C par exemple)
onExit(){
    displayLog
}
trap onExit EXIT


# Exécutée lors d'une erreur
onError(){
    echo ".. ERR: dans le script ${SCRIPT_NAME}" >> ${LOGERR}
}
trap onError ERR

# Affiche les logs le cas échéant
displayLog(){
    if [ -s "${LOGERR}" ]; then
        echo ".. ERR: Sortie du script ${SCRIPT_NAME}"
        cat "${LOGERR}"
    fi
    rm -f "${LOGERR}"
}

# Vérifie si le fichier existe
checkFile(){
    file="${1}"
    if [ ! -s "${file}" ]; then
        echo "${file} n'existe pas" >> "${LOGERR}"
        exit 1
    fi
}

ensureDir(){
    file="${1}"
    if [ ! -d "${file}" ]; then
        echo "${file} n'existe pas" >> "${LOGERR}"
        mkdir "${file}"
    fi
}

# -----------
# TRAITEMENTS
# -----------
cartouche(){
    head -n 33 "${SCRIPT_DIR}/${SCRIPT_NAME}" | grep -v "#!"
    echo "-------------------------------------------------"
}

make_damn_dirty_snake_visible(){
    ensureDir "${HOME}/bin"
    ln -s /usr/bin/python3.9 ${HOME}/bin/python
}

main(){
    cartouche
    apt-get -y install \
        cmake          \
        tmux           \
        apt-utils      \
        neovim         \
        xclip          \
        docker         \
        zsh            \
        curl           \
        git            \
        pandoc         \
        gzip           \
        coreutils      \
        jq             \
        xdg-utils      \
        python3.9

    make_damn_dirty_snake_visible
    ${SCRIPT_DIR}/../scripts/common-setup.sh
    ${SCRIPT_DIR}/../install
}

main
