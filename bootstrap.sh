#!/bin/bash

apt-get update
apt-get dist-upgrade -y
# we use 2.7.6 for crossbar and 3.4 for autobahn
apt-get install -y python-dev python3-dev
# for python cryptography
apt-get install -y build-essential libssl-dev libffi-dev
# for debugging and foo
apt-get install -y ipython3 python3-ipdb

wget https://bootstrap.pypa.io/get-pip.py
python2 get-pip.py
python3 get-pip.py
rm get-pip.py

pip2 install crossbar
pip3 install autobahn[asyncio]

