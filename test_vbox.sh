#!/bin/bash
my_user=rd
# Virtual box
wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
apt-get update
apt-get install -y virtualbox-5.1
sudo usermod -G vboxusers -a $my_user
# must be run as root :/    /sbin/vboxconfig
