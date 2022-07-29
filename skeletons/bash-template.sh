#!/bin/bash

# Développeur ....: K3rn€l_P4n1K
# Nom ............: @name
# Description ....: @description
# Version ........: @version
# Date ...........: @date
# Dépendances ....: @dependance

# Fonctionnalité .: @fonctionnalite
# Intention ......: @intention
# Remarque .......: @remarque


# ===========================
# Copyright @year K3rn€l P4n1k
# ===========================
#
# This file is part of @application.
#
# @application is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# @application is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with @application. If not, see <http://www.gnu.org/licenses/>.

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

# Vérifie si les fichiers en entrées sont des fichiers valide
checkFile(){
    file="${1}"
    if [ ! -s "${file}" ]; then
        echo "${file} n'existe pas" >> "${LOGERR}"
        exit 1
    fi
}

# --------------
# INITIALISATION
# --------------

USAGE="USAGE: ${SCRIPT_NAME} <argObligatoire> [argOptionnel]"

# Si pas de premier argument, on sors du script en affichant l'usage
argObligatoire=${1?${USAGE}}

# Si pas de deuxième argument, on fixe une valeur par default
argOptionnel=${2:-"Valeur par défault"}


# -----------
# TRAITEMENTS
# -----------
