#! /bin/bash

# Check for and install dependencies
check_deps(){
  which curl unzip > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "INFO: Located cUrl and unzip"
  else
    echo "INFO: Installing cUrl and unzip"
    sudo apt-get -y install curl unzip > /dev/null 2>&1
  fi
}

# Component Versions
set_versions(){
  export PACKERVERS=1.0.0
  export VAGRANTVERS=1.9.3
  export VBOXLATEST=`wget -q -O - http://download.virtualbox.org/virtualbox/LATEST.TXT`
}

print_versions(){
  echo "INFO: Target application versions"
  echo "INFO: Packer version $PACKERVERS"
  echo "INFO: Vagrant version $VAGRANTVERS"
  echo "INFO: VirtualBox version $VBOXLATEST"
}

# Install Components
inst_packer(){
  # Check for packer
  which packer > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "INFO: Packer installed"
    INSVER=`packer -v`
    echo "INFO: Packer version $INSVER"
  else
    echo "INFO: Installing Packer"
    mkdir -p ~/bin
    wget -q https://releases.hashicorp.com/packer/${PACKERVERS}/packer_${PACKERVERS}_linux_amd64.zip -O /tmp/packer_${PACKERVERS}_linux_amd64.zip
    unzip /tmp/packer_${PACKERVERS}_linux_amd64.zip
    mv packer ~/bin/packer-${PACKERVERS}
    chmod +x ~/bin/packer-${PACKERVERS}
    ln -s ~/bin/packer-${PACKERVERS} ~/bin/packer
    rm /tmp/packer_${PACKERVERS}_linux_amd64.zip
  fi
}

inst_vbox(){
  # Check for VirtualBox
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

    echo "INFO: Configuring VirtualBox repos"
    echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" > /tmp/virtualbox.list
    sudo cp /tmp/virtualbox.list /etc/apt/sources.list.d/virtualbox.list
    rm /tmp/virtualbox.list

    sudo apt-get update > /dev/null 2>&1

    echo "INFO: Installing VirtualBox dependencies"
    sudo apt-get -y install dkms > /dev/null 2>&1

    echo "INFO: Installing VirtualBox $VBOXLATEST"
    sudo apt-get -y install virtualbox-5.1 > /dev/null 2>&1

    # Vbox Extension pack
    echo "INFO: Installing VirtualBox Extension Pack $VBOXLATEST"
    wget -q http://download.virtualbox.org/virtualbox/$VBOXLATEST/Oracle_VM_VirtualBox_Extension_Pack-$VBOXLATEST.vbox-extpack -O /tmp/Oracle_VM_VirtualBox_Extension_Pack-$VBOXLATEST.vbox-extpack
    sudo VBoxManage extpack install /tmp/Oracle_VM_VirtualBox_Extension_Pack-$VBOXLATEST.vbox-extpack --accept-license=715c7246dc0f779ceab39446812362b2f9bf64a55ed5d3a905f053cfab36da9e > /dev/null 2>&1
    rm /tmp/Oracle_VM_VirtualBox_Extension_Pack-$VBOXLATEST.vbox-extpack

    # Add user to vboxuser group
    sudo usermod -a -G vboxusers $USER
  fi

}

inst_vagrant(){

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
    sudo wget -q https://raw.github.com/kura/vagrant-bash-completion/master/etc/bash_completion.d/vagrant -O /etc/bash_completion.d/vagrant
  fi

}

inst_remmina(){
  # Check for Remmina
  which remmina > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "INFO: Remmina installed"
    INSVER=`remmina -v|cut -d' ' -f4`
    echo "INFO: Remmina version $INSVER"
  else
    echo "INFO: Install Remmina"
    sudo add-apt-repository -y ppa:remmina-ppa-team/remmina-next > /dev/null 2>&1
    sudo apt-get update > /dev/null 2>&1
    sudo apt-get install -y remmina remmina-plugin-rdp freerdp-x11 > /dev/null 2>&1
  fi
}

inst_nhsbuntu_tweaks(){
  # Gnome3 tweaks
  # Install Alacarte
  echo "INFO: Install alacarte menu editors"
  sudo apt-get install -y alacarte > /dev/null 2>&1
  # Adjust Gnome3 screencast length
  gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 0
}


case "$1" in
      developer)
      check_deps
      set_versions
      inst_packer
      inst_vbox
      inst_vagrant
      inst_remmina
      ;;
      user)
      check_deps
      set_versions
      inst_vbox
      inst_vagrant
      inst_remmina
      inst_nhsbuntu_tweaks
			;;
      info)
      set_versions
      print_versions
      ;;
       *)
      echo "Usage: $0 {developer|user|info}"
esac

exit 0
