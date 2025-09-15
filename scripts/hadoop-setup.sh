#!/bin/bash

# download the zip file
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz
# unzipping the file
tar -xvzf hadoop-3.4.1.tar.gz
# store the file in ideal directory
mv hadoop-3.4.1 /usr/local/hadoop
# change the owner
sudo chown -R hadoop:hadoop /usr/local/hadoop

cd /usr/local/hadoop
ls
