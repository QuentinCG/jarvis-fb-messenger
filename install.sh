#!/usr/bin/env bash
# If a problem occurs during the install,
# consider adding "deb http://http.us.debian.org/debian/ testing non-free contrib main" to "/etc/apt/sources.list"
# and then do a "sudo apt-get update && sudo apt-get upgrade"
# and start the install again

# Install Python (python 2.7 and 3.x)
[[ -z $(which python) ]] && sudo apt-get install python
[[ -z $(which python2.7) ]] && sudo apt-get install python2.7
[[ -z $(which python3) ]] && sudo apt-get install python3

# Install pip
[[ -z $(which python-pip) ]] && sudo apt-get install python-pip
[[ -z $(which python3-pip) ]] && sudo apt-get install python3-pip

# Install libs used by fbchat (this may take some time since it needs to build libs)
[[ -z $(which libxml2-dev) ]] && sudo apt-get install libxml2-dev
[[ -z $(which libxslt1-dev) ]] && sudo apt-get install libxslt1-dev
[[ -z $(which libxml2) ]] && sudo apt-get install libxml2

# Install fbchat (needed for the jarvis-facebook messenger python script)
sudo pip2.7 install fbchat
sudo pip3 install fbchat
