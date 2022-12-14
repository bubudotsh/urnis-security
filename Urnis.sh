#!/bin/bash

if [ $# = 0 ]
then
    ./src/help.sh
elif [ $# = 1 ]
then
    if [ "$1" = "audit" ]
    then
        audit 2>&1 | tee data/log
    elif [ "$1" = "update" ]
    then
        echo "Updating"
    else
        echo "bad option, try ./Urnis.sh"
    fi 
elif [ $# = 2 ]
then
    if [ "$1" = "audit" ]
    then
        audit 2>&1 | tee data/log
        if [ "$2" = "mail" ]
        then
            audit 2>&1 | tee data/log
            sudo python3 src/mailsender.py
        else
            echo "bad option, try ./Urnis.sh"
        fi
    else
        echo "bad option, try ./Urnis.sh"
    fi
else 
    echo "bad option, try ./Urnis.sh"   
fi