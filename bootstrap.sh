#!/bin/sh

mkdir output # Pelican expects that the folder output/ already exists
python virtualenv.py mclab_env
source mclab_env/bin/activate
pip install pelican

