#!/bin/bash

# require netstat
# pour ssh login : essayer de faire un fichier /etc/ssh/sshrc

green=$(tput setaf 2)
red=$(tput setaf 1)
normal=$(tput sgr0)

BLEU='\033[0;34m'
LGREY='\033[0;37m'
NC='\033[0m'

where=$(pwd)

echo -e "[ Urnis setup ]\n\n"


whe=$(pwd)
sudo mkdir /usr/share/urnis
sudo cp -fr .* /usr/share/urnis
sudo cp -fr src/urnis /usr/sbin/urnis
sed -i -e "s/aaa/${whe}/g" /usr/sbin/urnis
sudo bash /usr/share/urnis