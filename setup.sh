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
sudo cp -fr .* /usr/share/urnis/
sudo cp -fr src/urnis /usr/sbin/
sudo chmod +x /usr/share/urnis/src/sshlogin.sh
sudo chmod +x /usr/share/urnis/audit.sh

sed -i '1s/^/bash \/usr\/share\/urnis\/src\/sshlogin.sh /' ~.bashrc