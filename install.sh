#!/bin/bash

# update
sudo apt-get update -y
sudo apt install dos2unix
sudo dos2unix *.sh
chmod +x *.sh



# install docker engine
./ubuntu-install-docker.sh

# install software
./ubuntu-install-software.sh

# install zsh and oh-my-zsh
./ubuntu-install-zsh.sh

# configure
./ubuntu-configure.sh