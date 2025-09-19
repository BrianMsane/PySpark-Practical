#!/bin/bash

# download the zip file, unzip, and move it
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz
tar -xvzf hadoop-3.4.1.tar.gz
sudo mv hadoop-3.4.1 /usr/local/hadoop
sudo chown -R hadoop:hadoop /usr/local/hadoop
cd /usr/local/hadoop
ls
