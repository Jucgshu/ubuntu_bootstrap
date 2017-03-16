#!/bin/bash
my_user=rd
# install pip, virtualenv and nodejs an npm
apt-get install -fy python-pip python-virtualenv htop iotop git jq remmina putty mysql-workbench variety

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
