#!/bin/bash

sudo apt update
sudo apt install python3.12-venv pip3 -y

# upgrade to latest version of pip
pip3 install --upgrade pip (TODO: confirm this)


cd $HOME
# creating the virtual environment in home directory for ease of accessibility
python3 -m venv pyspark-venv

# activating the environment variable
source pyspark-venv/bin/activate

# navigate to the requirements.txt file's directory
cd $REPO_SCRIPTS_HOME
cd ..

# installing dependecies
pip3 install -r requirements.txt
cd $HOME

# launch notebook
jupyter-notebook --no-browser --ip=0.0.0.0 --port=8888
