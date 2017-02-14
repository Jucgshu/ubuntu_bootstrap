# add deadsnakes repository for python version
add-apt-repository ppa:fkrull/deadsnakes -y
# add nodejs repository
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# update /upgrade
apt-get update &&  apt-get upgrade -y

# install pip, virtualenv and nodejs an npm
apt-get install -y python-pip python-virtualenv nodejs npm htop iotop virtualenvwrapper
pip install --upgrade --user boto3 aws-shell httpie awscli chalice requests
apt-get install -y python3.5 # this one is done AFTER the installation of virtualenv !

# Virtualenv bootstrap
touch ~./bashrc
echo 'export WORKON_HOME=~/.virtualenvs' >> ~/.bashrc
echo  'mkdir -p $WORKON_HOME' >> ~/.bashrc
echo  'source ~/.local/bin/virtualenvwrapper.sh' >> ~./bashrc
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
dpkg -i atom-amd64.deb
apt-get -f install
rm atom-amd64.deb
