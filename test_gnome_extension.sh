#!/bin/bash
my_user=rd

full_version=$(cat /usr/share/gnome/gnome-version.xml)
major_version=$(echo $full_version | grep -oPm1 "(?<=<platform>)[^<]+")
minor_version=$(echo $full_version | grep -oPm1 "(?<=<minor>)[^<]+")
micro_version=$(echo $full_version | grep -oPm1 "(?<=<micro>)[^<]+")
minor_version=${minor_version::-1}
total_version=$major_version.$minor_version$micro_version
echo $major_version
echo $minor_version
echo $total_version

wget -O gnome-shell-extension-installer "https://github.com/ianbrunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

runuser -l $my_user -c 'gnome-shell-extension-installer 1007 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 442 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 118 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 8 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 473 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 7 $total_version --yes'
