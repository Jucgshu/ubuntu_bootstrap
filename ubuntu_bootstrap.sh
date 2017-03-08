# this script must be run usin 'sudo -H ./ubuntu_bootstrap.sh'

# add nodejs repository
apt-get install curl
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# install pip, virtualenv and nodejs an npm
apt-get install -fy python-pip python-virtualenv nodejs htop iotop git jq keepass2 remmina putty mysql-workbench variety

# Install Virtualenvwrapper
pip install --user virtualenvwrapper

# Virtualenvwrapper bootstrap
echo 'export WORKON_HOME=~/.virtualenvs' >> ~/.bashrc
echo 'mkdir -p $WORKON_HOME' >> ~/.bashrc
echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.bashrc
source ~/.bashrc #reload bashrc

# Virtualenv creation
mkvirtualenv p27 -p /usr/bin/python2.7
mkvirtualenv p35 -p /usr/bin/python3.5

# Install python library
lib=$(pip install boto3 aws-shell httpie awscli chalice requests autopep8)
workon p27
echo $lib
workon p35
echo $lib

# Install framework serverless
npm install -g serverless

# Create hashicorp folder
mkdir ~/hashicorp ~/hashicorp/terraform ~/hashicorp/packer

# Install terraform
cd ~/hashicorp/terraform
wget https://releases.hashicorp.com/terraform/0.8.6/terraform_0.8.6_linux_amd64.zip
unzip terraform_0.8.6_linux_amd64.zip
rm terraform_0.8.6_linux_amd64.zip
export PATH=$PATH:~/hashicorp/terraform

# Install packer
cd ~/hashicorp/packer
wget https://releases.hashicorp.com/packer/0.12.2/packer_0.12.2_linux_amd64.zip
unzip packer_0.12.2_linux_amd64.zip
rm packer_0.12.2_linux_amd64.zip
export PATH=$PATH:~/hashicorp/packer

# Install Atom
cd
wget https://atom.io/download/deb
dpkg -i deb
apt-get -f install
rm deb

# Virtual box
wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
apt-get update
apt-get install -y virtualbox-5.1
sudo usermod -G vboxusers -a $USER
# must be run as root :/    /sbin/vboxconfig

# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
apt-get update
apt-get install -y google-chrome-stable

# Git config
git config --global user.name "Richard Devers"
git config --global user.email "ritchiedev@hotmail.com"
