#! /bin/bash

# Update and update

echo "Update/upgrade OS"
sudo apt update
sudo apt upgrade -y

# Install nice to have utils
sudo apt install -y curl htop iotop iftop tmux lnav nmap

# Google Chrome

echo "INFO: Installing Google Chrome"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable

# Git and Git-lfs

echo "INFO: Installing Git and Git-LFS"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-add-repository -y ppa:git-core/ppa
sudo apt update
sudo apt install -y git
sudo apt install -y git-lfs

# Atom
echo "INFO: Installing Atom"
wget -q https://atom.io/download/deb -O /tmp/atom-amd64.deb
sudo dpkg -i /tmp/atom-amd64.deb
rm /tmp/atom-amd64.deb
