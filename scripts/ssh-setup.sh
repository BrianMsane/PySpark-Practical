#!/bin/bash

sudo apt install openssh-server openssh-client -y
ssh-keygent -t rsa 

# add the public key to authorized_keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
sudo chmod 640 ~/.ssh/authorized_keys
ssh localhost
