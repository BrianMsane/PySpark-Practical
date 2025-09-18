#!/bin/bash

sudo apt install python3.12-venv pip3
pip3 install --upgrade pip


cd $HOME
# creating the virtual environment in home directory
python3 -m venv pyspark-venv

# activating the environment variable
source pyspark-venv/bin/activate

# installing dependencies
cd $SCRIPTS_HOME
cd ..
pip3 install -r requirements.txt
cd $HOME

# launch notebook
jupyter-notebook --no-browser --ip=0.0.0.0 --port=8888
