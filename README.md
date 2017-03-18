# ubuntu_bootstrap
This script automates the installation of my tools on a fresh Ubuntu installation.
It works only on x64 environment.

It has been tested on a fresh & updated Ubuntu 16.10 (Gnome 3 flavor).

_Note_: don't forget to add your ssh key to your server before you execute the script. To do this, you can either use ```ssh-copy-id my_user@my_server``` or manually add it to your ```~/.ssh/authorized_keys``` file.

To install, just run ```sudo -H ./ubuntu_bootstrap.sh 2>error```
