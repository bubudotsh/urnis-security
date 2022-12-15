path="/usr/share/urnis/data/tmp.txt"

sender=$(grep mailsender src/urnis.conf | cut -c 13- | sed 's/"//g')
passw=$(grep password src/urnis.conf | cut -c 10- | sed 's/"//g')
reciver=$(grep mailreciver src/urnis.conf | cut -c 13- | sed 's/"//g')

curl -s https://ipinfo.io/$(echo $SSH_CLIENT | awk '{ print $1}') > ${path}
sed -i -e "s/  //g" ${path}
sed -i -e "s/{//g" ${path}
sed -i -e "s/}//g" ${path}
sed -i -e "s/,//g" ${path}
sed -i -e 's/"//g' ${path}
python3 /user/share/urnis/src/mailsender.py ${sender} ${passw} ${reciver} ${path}