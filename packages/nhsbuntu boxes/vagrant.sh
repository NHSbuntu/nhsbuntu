#! /bin/bash

# Install Vagrant

# Check for Vagrant
which vagrant > /dev/null 2>&1
if [ $? -eq 0 ]
then
  echo "INFO: Vagrant installed"
  INSVER=`vagrant -v`
  echo "INFO: Vagrant version $INSVER"
else
  echo "INFO: Installing Vagrant"
  wget -q https://releases.hashicorp.com/vagrant/${VAGRANTVERS}/vagrant_${VAGRANTVERS}_x86_64.deb -O /tmp/vagrant_${VAGRANTVERS}_x86_64.deb
  sudo dpkg -i /tmp/vagrant_${VAGRANTVERS}_x86_64.deb > /dev/null 2>&1
  rm /tmp/vagrant_${VAGRANTVERS}_x86_64.deb
fi

exit 0
