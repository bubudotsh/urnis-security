#!/bin/bash

# require netstat

green=$(tput setaf 2)
red=$(tput setaf 1)
normal=$(tput sgr0)

BLEU='\033[0;34m'
LGREY='\033[0;37m'
NC='\033[0m'

where=$(pwd)

echo -e "[ Urnis setup ]\n\n"


pathd="/usr/share"
pathf="/usr/sbin/"

if [ -d ${pathd} ]; then
    sudo mkdir /usr/share/urnis
    sudo cp -fr .* /usr/share/urnis/
else
    echo -e "${pathd} not found"
    exit
fi

if [ -d ${pathf} ]; then
    sudo cp -fr src/urnis /usr/sbin/
    sudo chmod +x /usr/sbin/urnis
else
    echo -e "${pathf} not found"
    exit
fi

echo "Done, you can try sudo urnis -h"