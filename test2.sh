#!/bin/bash
if [ -f ~/.ssh/id_rsa ]; then
chmod 400 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
fi
