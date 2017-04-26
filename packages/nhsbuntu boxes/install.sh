#! /bin/bash

# First script for 'nhsbox'

echo "INFO: Installing cUrl"
sudo apt-get -y install curl > /dev/null 2>&1

# Global vars
VBOXLATEST=`curl -sS http://download.virtualbox.org/virtualbox/LATEST.TXT`

# Virtualbox
echo "INFO: Adding Oracle keys to APT"

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - > /dev/null 2>&1
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - > /dev/null 2>&1

echo "INFO: Installing VirtualBox $VBOXLATEST"
echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" > /tmp/virtualbox.list
sudo cp /tmp/virtualbox.list /etc/apt/sources.list.d/virtualbox.list
rm /tmp/virtualbox.list

sudo apt-get update > /dev/null 2>&1
sudo apt-get -y install dkms > /dev/null 2>&1
sudo apt-get -y install virtualbox-5.1 > /dev/null 2>&1

# Vbox Extension pack
echo "INFO: Installing VirtualBox Extension Pack $VBOXLATEST"
wget -q http://download.virtualbox.org/virtualbox/$VBOXLATEST/Oracle_VM_VirtualBox_Extension_Pack-$VBOXLATEST.vbox-extpack -O /tmp/Oracle_VM_VirtualBox_Extension_Pack-$VBOXLATEST.vbox-extpack
sudo VBoxManage extpack install /tmp/Oracle_VM_VirtualBox_Extension_Pack-$VBOXLATEST.vbox-extpack --accept-license=715c7246dc0f779ceab39446812362b2f9bf64a55ed5d3a905f053cfab36da9e > /dev/null 2>&1
rm /tmp/Oracle_VM_VirtualBox_Extension_Pack-$VBOXLATEST.vbox-extpack

# Vagrant
echo "INFO: Installing Vagrant"
wget -q https://releases.hashicorp.com/vagrant/1.9.3/vagrant_1.9.3_x86_64.deb -O /tmp/vagrant_1.9.3_x86_64.deb
sudo dpkg -i /tmp/vagrant_1.9.3_x86_64.deb > /dev/null 2>&1
rm /tmp/vagrant_1.9.3_x86_64.deb

# Remmina
echo "INFO: Install Remmina"
sudo add-apt-repository -y ppa:remmina-ppa-team/remmina-next > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y remmina remmina-plugin-rdp freerdp-x11 > /dev/null 2>&1

# Gnome3 tweaks

# Install Alacarte
echo "INFO: Install alacarte menu editors"
sudo apt-get install -y alacarte > /dev/null 2>&1

# Adjust Gnome3 screencast length
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 0
