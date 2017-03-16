#!/bin/bash
# this script must be run usin 'sudo -H ./ubuntu_bootstrap.sh'
# to do before: Add the ssh key to /home/$my_user/.ssh/
my_user=rd

# add nodejs repository
apt-get install curl
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# install pip, virtualenv and nodejs an npm
apt-get install -fy python-pip python-virtualenv htop iotop git jq keepass2 remmina putty mysql-workbench variety

# install virtualenvwrapper
pip install virtualenvwrapper

# Virtualenvwrapper bootstrap
runuser -l $my_user -c 'echo 'export WORKON_HOME=~/.virtualenvs' >> ~/.bashrc'
runuser -l $my_user -c 'echo 'mkdir -p $WORKON_HOME' >> ~/.bashrc'
runuser -l $my_user -c 'echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc'
runuser -l $my_user -c '~/.bashrc'

# Virtualenv creation
runuser -l $my_user -c 'mkvirtualenv p27 -p /usr/bin/python2.7'
runuser -l $my_user -c 'mkvirtualenv p35 -p /usr/bin/python3.5'

# Install python library
runuser -l $my_user -c 'workon p27'
runuser -l $my_user -c 'pip install boto3 aws-shell httpie awscli chalice requests autopep8'
runuser -l $my_user -c 'workon p35'
runuser -l $my_user -c 'pip install boto3 aws-shell httpie awscli chalice requests autopep8'

# Install hashicorp tools
#mkdir ~/hashicorp ~/hashicorp/terraform ~/hashicorp/packer
#cd ~/hashicorp/terraform

# terraform
#wget https://releases.hashicorp.com/terraform/0.8.6/terraform_0.8.6_linux_amd64.zip
#unzip terraform_0.8.6_linux_amd64.zip
#rm terraform_0.8.6_linux_amd64.zip
#export PATH=$PATH:~/hashicorp/terraform

# packer
#cd ~/hashicorp/packer
#wget https://releases.hashicorp.com/packer/0.12.2/packer_0.12.2_linux_amd64.zip
#unzip packer_0.12.2_linux_amd64.zip
#rm packer_0.12.2_linux_amd64.zip
#export PATH=$PATH:~/hashicorp/packer

# Install Atom
cd
wget https://atom.io/download/deb
dpkg -i deb
apt-get -f install
rm deb

# Virtual box
#wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
#echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
#apt-get update
#apt-get install -y virtualbox-5.1
#sudo usermod -G vboxusers -a $USER
# must be run as root :/    /sbin/vboxconfig

# Chrome (only works on 64bits architecture)
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
apt-get update
apt-get install -y google-chrome-stable

# Git config
runuser -l $my_user -c 'git config --global user.name "Richard Devers"'
runuser -l $my_user -c 'git config --global user.email "ritchiedev@hotmail.com"'

# Add ssh key if exist
if [ -f /home/$my_user/.ssh/id_rsa ]; then
chmod 400 /home/$my_user/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add /home/$my_user/.ssh/id_rsa
fi

# Add gnome extension
full_version=$(cat /usr/share/gnome/gnome-version.xml)
major_version=$(echo $full_version | grep -oPm1 "(?<=<platform>)[^<]+")
minor_version=$(echo $full_version | grep -oPm1 "(?<=<minor>)[^<]+")
micro_version=$(echo $full_version | grep -oPm1 "(?<=<micro>)[^<]+")
minor_version=${minor_version::-1}
total_version=$major_version.$minor_version$micro_version
echo $major_version
echo $minor_version
echo $total_version

my_user=rd
wget -O gnome-shell-extension-installer "https://github.com/ianbrunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

runuser -l $my_user -c 'gnome-shell-extension-installer 1007 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 442 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 118 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 8 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 473 $total_version --yes'
runuser -l $my_user -c 'gnome-shell-extension-installer 7 $total_version --yes'
