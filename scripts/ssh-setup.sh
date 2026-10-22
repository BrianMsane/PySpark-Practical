#!/bin/bash

sudo apt install openssh-server openssh-client ssh pdsh -y

ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
sudo chmod 600 ~/.ssh/authorized_keys
ssh localhost exit
