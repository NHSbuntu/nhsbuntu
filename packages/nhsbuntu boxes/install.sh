#! /bin/bash

# First script for 'nhsbox'

# Virtualbox
echo "INFO: Installing Vbox 5.1"

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list

sudo apt update
sudo apt install -y dkms
sudo apt install -y virtualbox-5.1

# Vbox Extension pack
wget -q http://download.virtualbox.org/virtualbox/5.1.18/Oracle_VM_VirtualBox_Extension_Pack-5.1.18-114002.vbox-extpack -O /tmp/Oracle_VM_VirtualBox_Extension_Pack-5.1.18-114002.vbox-extpack
VBoxManage extpack install /tmp/Oracle_VM_VirtualBox_Extension_Pack-5.1.18-114002.vbox-extpack
rm /tmp/Oracle_VM_VirtualBox_Extension_Pack-5.1.18-114002.vbox-extpack

# Vagrant
echo "INFO: Installing Vagrant"
wget -q https://releases.hashicorp.com/vagrant/1.9.3/vagrant_1.9.3_x86_64.deb?_ga=1.24420467.838344986.1490302773 -O /tmp/vagrant_1.9.3_x86_64.deb
sudo dpkg -i /tmp/vagrant_1.9.3_x86_64.deb
rm /tmp/vagrant_1.9.3_x86_64.deb

# Remmina
echo "INFO: Install Remmina"
sudo add-apt-repository -y ppa:remmina-ppa-team/remmina-next
sudo apt update
sudo apt install -y remmina remmina-plugin-rdp freerdp-x11

# Gnome3 tweaks

# Install Alacarte
echo "INFO: Install alacarte menu editors"
sudo apt install -y alacarte

# Adjust Gnome3 screencast length
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 0
