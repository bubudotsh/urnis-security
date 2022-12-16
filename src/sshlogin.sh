path="~/.urnis/data.txt"

# fiabilisation (verifier presance dossier...)
# fix ssh login
# fix cpu name
# disk space
# add web site monit server info
# add date of scan in audit


sender=$(grep mailsender /usr/share/urnis/src/urnis.conf | cut -c 13- | sed 's/"//g')
passw=$(grep password /usr/share/urnis/src/urnis.conf | cut -c 10- | sed 's/"//g')
reciver=$(grep mailreciver /usr/share/urnis/src/urnis.conf | cut -c 13- | sed 's/"//g')

curl -s https://ipinfo.io/$(echo $SSH_CLIENT | awk '{ print $1}') > ${path}
sed -i -e "s/  //g" ${path}
sed -i -e "s/{//g" ${path}
sed -i -e "s/}//g" ${path}
sed -i -e "s/,//g" ${path}
sed -i -e 's/"//g' ${path}
python3 ~/.urnis/mailsender.py ${sender} ${passw} ${reciver} ${path}