#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install python3.12-venv -y
sudo apt install -y python3-pip
pip3 install --upgrade pip

cd $HOME
# create virtual environment in home directory
python3 -m venv pyspark-venv

# activating the virtual environment
source pyspark-venv/bin/activate

# installing dependencies
cd $SCRIPTS_HOME
cd ..
pip3 install -r requirements.txt
cd $HOME

# launch notebook
jupyter-notebook --no-browser --ip=0.0.0.0 --port=8888
