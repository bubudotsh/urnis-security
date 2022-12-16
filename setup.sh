#!/bin/bash

# require netstat
green=$(tput setaf 2)
red=$(tput setaf 1)
normal=$(tput sgr0)

BLEU='\033[0;34m'
LGREY='\033[0;37m'
NC='\033[0m'

where=$(pwd)
pathd="/usr/share"
pathf="/usr/sbin/"

echo -e "[ Urnis setup ]\n\n"

if [ -d ${pathd} ]; then
    sudo mkdir ${pathd}/urnis
    sudo cp .* ${pathd}/urnis/
else
    echo -e "${pathd} not found"
    exit
fi

if [ -d ${pathf} ]; then
    sudo cp -fr src/urnis /usr/sbin/
else
    echo -e "${pathf} not found"
    exit
fi

echo "Done, you can try sudo urnis -h"