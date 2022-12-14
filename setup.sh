#!/bin/bash

green=$(tput setaf 2)
red=$(tput setaf 1)
normal=$(tput sgr0)

BLEU='\033[0;34m'
LGREY='\033[0;37m'
NC='\033[0m'

echo -e "[ Urnis setup ]\n\n"

echo -e "${BLEU}[+] Configurations of mail${NC}"
echo -e "enter mail"
