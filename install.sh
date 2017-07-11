#!/usr/bin/env bash

# Install Python (Python 3.x)
[[ -z $(which python) ]] && sudo apt-get --yes --force-yes install python
[[ -z $(which python3) ]] && sudo apt-get --yes --force-yes install python3
#[[ -z $(which python2.7) ]] && sudo apt-get --yes --force-yes install python2.7

# Install pip
[[ -z $(which pip) ]] && sudo apt-get --yes --force-yes install python-pip
[[ -z $(which pip3) ]] && sudo apt-get --yes --force-yes install python3-pip

# Install libs used by fbchat (this may take some time since it needs to build libs)
# All those libs are used to build lxml which is used by fbchat
# More information here: http://stackoverflow.com/questions/5178416/pip-install-lxml-error
[[ -z $(which libxml2-dev) ]] && sudo apt-get --yes --force-yes install libxml2-dev
[[ -z $(which libxslt1-dev) ]] && sudo apt-get --yes --force-yes install libxslt1-dev
[[ -z $(which libxml2) ]] && sudo apt-get --yes --force-yes install libxml2
[[ -z $(which python-dev) ]] && sudo apt-get --yes --force-yes install python-dev
[[ -z $(which python3-dev) ]] && sudo apt-get --yes --force-yes install python3-dev
[[ -z $(which zlib1g-dev) ]] && sudo apt-get --yes --force-yes install zlib1g-dev

# Install beautifulsoup4 (should be installed by fbchat but do it before just in case)
sudo pip3 install beautifulsoup4
sudo pip3 install bs4

# Install fbchat (needed for the jarvis-facebook messenger python script)
sudo pip3 install fbchat --upgrade

# Copy latest version of "facebook messenger sender" python script
rm script/fb_messenger_send.py
wget -P script/ https://raw.githubusercontent.com/QuentinCG/Base-Scripts/master/OS_Independent/utils/fb_messenger_send.py
