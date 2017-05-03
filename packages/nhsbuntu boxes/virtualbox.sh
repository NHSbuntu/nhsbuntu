#! /bin/bash

# Install Virtualbox

# Virtualbox

which vboxmanage > /dev/null 2>&1
if [ $? -eq 0 ]
then
  echo "INFO: VirtualBox installed"
  INSVER=`vboxmanage -v`
  echo "INFO: VirtualBox version $INSVER"
else
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

  # Add user to vboxuser group
  sudo usermod -a -G vboxusers $USER

fi

exit 0
