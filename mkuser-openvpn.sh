#!/bin/bash
echo "What would you like to be the name of you user?"
read name
adduser $name
usermod -aG sudo $name
cd /home/$name
apt update && apt upgrade -y
apt install curl
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
chmod 777 openvpn-install.sh
./openvpn-install.sh
file=$(ls /root | grep .ovpn)
mv /root/$file /home/$name
clear
cat /home/$name/$file
su $name
