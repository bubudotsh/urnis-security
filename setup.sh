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
# sudo chmod +x /usr/share/urnis/src/sshlogin.sh
# sudo chmod +x /usr/share/urnis/audit.sh



# pathd="/usr/share"
# pathf="/usr/sbin/"

# echo -e "[ Urnis setup ]\n\n"

# if [ -d ${pathd} ]; then
#     sudo mkdir ${pathd}/urnis
#     sudo cp -fr .* ${pathd}/urnis/
# else
#     echo -e "${pathd} not found"
#     exit
# fi

# if [ -d ${pathf} ]; then
#     sudo cp -fr src/urnis /usr/sbin/urnis
# else
#     echo -e "${pathf} not found"
#     exit
# fi

echo "Done, you can try sudo urnis -h"

# sed -i '1s/^/bash \/usr\/share\/urnis\/src\/sshlogin.sh /' ~/.bashrc