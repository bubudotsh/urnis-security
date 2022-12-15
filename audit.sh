#!/bin/bash

green=$(tput setaf 2)
red=$(tput setaf 1)
normal=$(tput sgr0)

BLEU='\033[0;34m'
LGREY='\033[0;37m'
NC='\033[0m'

sender=$(grep mailsender src/urnis.conf | cut -c 13- | sed 's/"//g')
passw=$(grep password src/urnis.conf | cut -c 10- | sed 's/"//g')
reciver=$(grep mailreciver src/urnis.conf | cut -c 13- | sed 's/"//g')
tim=$(grep timet src/urnis.conf | cut -c 7- | sed 's/"//g')
pathfilemail="/usr/share/urnis/data/audit"

pathaudit="/user/share/urnis/data/audit"
pathlog="/user/share/urnis/data/log"


helper () {
    echo -e "${LGREY}[ Urnis 1.0.0 ]${NC}\n\n"

    echo -e "   ${BLEU}Description${NC}"
    printf "       Urnis is a script that performs a security audit of your system.\n\n"

    echo -e "   ${BLEU}Usage${NC}"
    echo -e "       urnis OPTION"

    echo -e "\n   ${BLEU}Option${NC}"
    printf "%-20s %-20s %s\n" "       -a" "audit" "make audit of your system"
    printf "%-20s %-20s %s\n" "       -u" "update" "update of Urnis"
    printf "%-20s %-20s %s\n" "       -l" "look" "generation of an audit every 12 hours automatically"
    printf "%-20s %-20s %s\n" "       -m" "audit mail" "make audit of your system and send it by email"

    echo -e "\n   ${BLEU}Author${NC}"
    printf "%-20s %s\n" "       github" "https://github.com/bubudotsh/urnis-secutity"
    printf "%-20s %s\n" "       developper" "BUNELIER Hugo"
    echo -e "\n"
}

maj () {
    echo -e "\n\n${BLEU}[+] MAJ SYSTEM${NC}\n-----------------------------------\n"
    (sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt update -y && sudo apt upgrade -y) > /user/share/urnis/data/log-maj
    echo -e 'maj log aviable in /user/share/urnis/data/log-maj \n'
}

user_empty_password () {
    echo -e "\n\n${BLEU}[+] USER EMPTY PASSWORD${NC}\n-----------------------------------\n"
    sleep 1
    printf "%-20s %s\n" "user empty pass:" "$(sudo getent shadow | grep ':!:' | cut -d: -f1 | wc -l)" >> ${pathaudit}
    sudo getent shadow | grep ':!:' | cut -d: -f1 
}

user_with_admin_right () {
    echo -e "\n\n${BLEU}[+] USER WITH ADMIN RIGHT${NC}\n-----------------------------------\n"
    sleep 1
    printf "%-20s %s\n" "user admin right:" "$(sudo cat /etc/sudoers | grep '^%admin' | wc -l)" >> ${pathaudit}
    sudo cat /etc/sudoers | grep '^%admin'
}

open_port () {
    echo -e "\n\n${BLEU}[+] OPEN PORT${NC}\n-----------------------------------\n"
    sleep 1
    printf "%-20s %s\n" "open port:" "$(sudo netstat -tulpn | wc -l)" >> ${pathaudit}
    sudo netstat -tulpn
}

admin_service () {
    echo -e "\n\n${BLEU}[+] ADMIN SERVICE${NC}\n-----------------------------------\n"
    sleep 1
    printf "%-20s %s\n" "admin service:" "$(sudo service --status-all | awk '{print $4}' | wc -l)" >> ${pathaudit}
    sudo service --status-all | awk '{print $4}'
}

firewall () {
    echo -e "\n\n${BLEU}[+] FIREWALL${NC}\n-----------------------------------\n"
    sleep 1
    echo -e "$(sudo ufw status)" 2>&1 | tee -a ${pathaudit}
}

scan () {
    echo -e "\n\n${BLEU}[+] SCAN FILES${NC}\n-----------------------------------\n"
    echo -e "Scan directories file...\n"
    total_file=0
    suspect_file=0
    hashfile="/user/share/urnis/src/MD5Hahses.txt"
    file_path="/user/share/urnis/src/dir.txt"
    while read -r line; do
        if [ -d "$line" ]; then
            printf "%-20s %s\n" "   $line" "${green}FOUND${normal}"
            if [ ! -f "$hashfile" ]; then
                echo "Hash file list not found"
                exit 1
            fi
            for file in "$line"/*; do
                if [ -d "$file" ]; then
                    echo -n
                else
                    file_hash=$(md5sum "$file" | cut -d' ' -f1)
                    match=$(grep "$file_hash" "$hashfile")
                    if [ -z "$match" ]; then
                        ((total_file=total_file+1))
                    else
                        printf "%-60s %s\n" " $file" "SUSPECT" >> ${pathlog} 2>> ${pathlog}
                        ((suspect_file=suspect_file+1))
                    fi
                fi
            done
        else
            printf "%-20s %s\n" "   $line" "${red}NOT FOUND${normal}"
            
        fi
    done < "$file_path"
    ((total_file=total_file+suspect_file))
    echo -e "suspect files:        $suspect_file" >> ${pathaudit}
    echo -e "total files:          $total_file" >> ${pathaudit}
}

os_detections() {
    echo -e "${BLEU}[+] OS detections${NC}\n-----------------------------------\n"
    sleep 1
    printf "%-20s %s\n" "System" "$(egrep '^(NAME)=' /etc/os-release | cut -c 7- | sed 's/"//g')" 2>&1 | tee -a ${pathaudit}
    printf "%-20s %s\n" "System version" "$(egrep '^(VERSION)=' /etc/os-release | cut -c 9- | sed 's/"//g')" 2>&1 | tee -a ${pathaudit}
    printf "%-20s %s\n" "cpu" "$(cat /proc/cpuinfo | grep -i "^model name" | awk -F": " '{print $2}' | head -1 | sed 's/ \+/ /g')" 2>&1 | tee -a ${pathaudit}
    printf "%-20s %s\n" "Number of cpu" "$(cat /proc/cpuinfo | grep processor | wc -l)" 2>&1 | tee -a ${pathaudit}
    printf "%-20s %s\n" "RAM" "$(grep MemTotal /proc/meminfo | awk -F": " '{print $2}' | sed 's/ //g')" 2>&1 | tee -a ${pathaudit}
}

prog () {
    echo -e "\n\n${BLEU}[+] RECOMANDED PROGRAMS${NC}\n-----------------------------------\n"
    sleep 1
    file_path="/user/share/urnis/src/pro.txt"
    while read -r line; do
        if command -v $line > /dev/null 2>&1; then
            printf "%-20s %s\n" "$line" "${green}FOUND${normal}"
        else
            printf "%-20s %s\n" "$line" "${red}NOT FOUND${normal}"
        fi
    done < "$file_path"
}

info () {
    echo "==================================================================================="
    echo -e "Urniscomes with ABSOLUTELY NO WARRANTY. This is free software,
and you are welcome to redistribute it under the terms of the GNU General
Public License.\n"
    printf "%-10s %s\n" "GitHub:" "gitlink"
    printf "%-10s %s\n" "Creator:" "BUNELIER Hugo"
    printf "%-10s %s\n" "Update:" "please check the update on the project's git hub for new functionality"
    echo -e "===================================================================================\n\n"
}

audit () {
    echo -e "${LGREY}[ Urnis 1.0.0 ]${NC}\n\n"
    echo -e "[ Urnis 1.0.0 ]\n\n" > ${pathaudit}

    info
    sleep 2
    echo -e "---------------------------------------" >>${pathaudit}
    os_detections
    echo -e "---------------------------------------" >> ${pathaudit}
    BLA::start_loading_animation "${BLA_classic[@]}"
    maj
    prog
    user_empty_password
    user_with_admin_right
    open_port
    admin_service
    firewall
    echo -e "---------------------------------------" >>${pathaudit}
    scan
    BLA::stop_loading_animation
    echo -e "---------------------------------------" >> ${pathaudit}
    echo -e "\n\n${BLEU}[+] SOURCES${NC}\n-----------------------------------\n"
    printf "%-20s %s\n" "maj log:" "/user/share/urnis/data/log-maj" 2>&1 | tee -a ${pathaudit}
    printf "%-20s %s\n" "scan log:" "${pathlog}" 2>&1 | tee -a ${pathaudit}
    printf "%-20s %s\n" "result scan:" "${pathaudit}" 2>&1 | tee -a ${pathaudit}
    echo -e "---------------------------------------" >> ${pathaudit}
    echo -e "\n\n${BLEU}[+] RESULT${NC}\n-----------------------------------\n"
    cat ${pathaudit}
}

look () {
    timm=$(($tim * 3600))
    while true; do
        audit >> ${pathlog}
        sudo python3 /user/share/urnis/src/mailsender.py ${sender} ${passw} ${reciver}
        sleep $timm
    done
}

while getopts "huamlt" option; do
case $option in
    h)
        helper
        exit;;
    u)
        echo "update"
        exit;;
    a)
        audit 2>&1 | tee -a ${pathlog}
        exit;;
    m)
        audit 2>&1 | tee -a ${pathlog}
        sudo python3 src/mailsender.py ${sender} ${passw} ${reciver} ${pathfilemail}
        exit;;
    t)
        look
        exit;;
    \?)
        echo "bad option, help : -h"
        exit;;
    esac
done
