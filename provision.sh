#!/bin/bash
echo "Starting provisioning of RASA environment..."

#
# Install required packages
#
sudo apt update -y
sudo apt install -y python3-dev python3-pip

#
# Update to Python 3.6
#
# sudo add-apt-repository -y ppa:jonathonf/python-3.6
# sudo apt-get update
# sudo apt-get install -y python3.6

#
# Bootstrap installation of PIP
#
curl -sS https://bootstrap.pypa.io/get-pip.py >> /tmp/setup.py
sudo python3 /tmp/setup.py

#
# Downgrade PIP to earlier version that works
#
sudo pip install --upgrade --force-reinstall pip==9.0.3

#
# Upgrade packages required by RASA
#
sudo pip install --upgrade PyJWT

#
# Install the RASA packages
#
pip install rasa-x --extra-index-url https://pypi.rasa.com/simple

echo "Done!"
