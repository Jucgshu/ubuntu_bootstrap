# this script must be run usin 'sudo -H ubuntu_bootstrap.sh'
# add nodejs repository
apt-get install curl
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# install pip, virtualenv and nodejs an npm
apt-get install -fy python-pip python-virtualenv nodejs htop iotop virtualenvwrapper git
pip install --upgrade --user boto3 aws-shell httpie awscli chalice requests

# Virtualenv bootstrap
echo 'export WORKON_HOME=~/.virtualenvs' >> ~/.bashrc
echo  'mkdir -p $WORKON_HOME' >> ~/.bashrc
echo  'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.bashrc
source ~/.bashrc #recharge bashrc

# Virtualenv creation
virtualenv p27 -p /usr/bin/python2.7
virtualenv p35 -p /usr/bin/python3.5

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
