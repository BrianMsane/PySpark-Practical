#!/bin/bash

# download the zip file, unzip, and move it
wget https://archive.apache.org/dist/hadoop/common/hadoop-3.5.0/hadoop-3.5.0.tar.gz
tar xzf hadoop-3.5.0.tar.gz
mv hadoop-3.5.0 hadoop
rm hadoop-3.5.0.tar.gz
