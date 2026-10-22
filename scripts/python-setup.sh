#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install python3.14-venv -y
sudo apt install -y python3-pip
pip3 install --upgrade pip

# create virtual environment and install dependencies
cd $HOME
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env

mkdir practical && cd practical
uv init .
uv venv
uv pip3 install -r $HOME/PySpark-Practical/requirements.txt

# launch notebook
uv run jupyter-notebook --no-browser --ip=0.0.0.0 --port=8888
