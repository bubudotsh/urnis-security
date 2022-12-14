#!/bin/bash

green=$(tput setaf 2)
red=$(tput setaf 1)
normal=$(tput sgr0)

BLEU='\033[0;34m'
LGREY='\033[0;37m'
NC='\033[0m'

echo -e "${LGREY}[ Urnis 1.0.0 ]${NC}\n\n"

echo -e "   ${BLEU}Description${NC}"
printf "       Urnis is a script that performs a security audit of your system.\n\n"

echo -e "   ${BLEU}Usage${NC}"
echo -e "       urnis OPTION"

echo -e "\n   ${BLEU}Option${NC}"
printf "%-20s %s\n" "       audit" "make audit of your system"
printf "%-20s %s\n" "       update" "update of Urnis"
printf "%-20s %s\n" "       pm2" "generation of an audit every 12 hours automatically"
printf "%-20s %s\n" "       audit mail" "make audit of your system and send it by email"

echo -e "\n   ${BLEU}Author${NC}"
printf "%-20s %s\n" "       github" "https://github.com/bubudotsh/urnis-secutity"
printf "%-20s %s\n" "       developper" "BUNELIER Hugo"
echo -e "\n"