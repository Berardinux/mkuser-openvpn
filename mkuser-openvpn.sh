#!/bin/bash
echo "What would you like to be the name of you user?"
read $name
adduser $name
usermod -aG sudo $name
cd /home/$name
apt update && apt upgrade -y
apt install curl
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
chmod 777 openvpn-install.sh
./openvpn-install.sh
clear
for file in *.ovpn; do
    if [[ -f "$file" ]]; then
        cat "$file"
    fi
done
su $name
