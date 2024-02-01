#!/bin/zsh

# Script Name:  backup.zsh
# Author:       Pablo Andrade
# Created:      28/11/2023
# Version:      1.0

# To decompress
#tar -xzvf $bkp_file

# Debugging ON/OFF
#set -x

# Variables
source config.sh

# Backup
function exec_bkp () {
        echo "-> Iniciando Backup..."
        rsync -av --progress --partial --append-verify $main_dir $bkp_dir > $bkp_dir/$data.log
}

# Compress
function exec_compact () {
        echo "-> Iniciando compactação..."
        tar --remove-files -czvf $bkp_file *
}

# Execution
if exec_bkp; then
        echo "-> Backup executado com sucesso!"
else
        echo "-> ERRO durante o backup."
fi

cd $bkp_dir

if exec_compact; then
        echo "-> Compactado com sucesso!"
else
        echo "-> ERRO durante a compactação."
fi
