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


whe=$(pwd)
sudo mkdir /usr/share/urnis
sudo cp -fr .* /usr/share/urnis
sudo cp -fr src/urnis /usr/sbin/urnis
sed -i -e "s/aaa/${whe}/g" /usr/sbin/urnis/src/clean.sh
chmod +x /usr/share/urnis/src/clean.sh
chmod +x /usr/share/urnis/src/sshlogin.sh
chmod +x /usr/share/urnis/audit.sh

sudo touch /etc/ssh/sshrc
sudo echo "bash /usr/share/urnis/src/sshlogin.sh" >> /etc/ssh/sshrc

./src/clean.sh