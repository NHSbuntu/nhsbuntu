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

# Global vars
set_versions(){
  export PACKERVERS=1.0.0
  export VAGRANTVERS=1.9.4
  export VBOXLATEST=`wget -q -O - http://download.virtualbox.org/virtualbox/LATEST.TXT`
}

print_versions(){
  echo "INFO: Target application versions"
  echo "INFO: Packer version $PACKERVERS"
  echo "INFO: Vagrant version $VAGRANTVERS"
  echo "INFO: VirtualBox version $VBOXLATEST"
}

case "$1" in
      developer)
      check_deps
      set_versions
      ./packer.sh
      ./virtualbox.sh
      ./vagrant.sh
      ./remmina.sh
      ;;
      user)
      check_deps
      set_versions
			./virtualbox.sh
      ./vagrant.sh
      ./remmina.sh
			;;
      info)
      set_versions
      print_versions
      ;;
       *)
      echo "Usage: $0 {developer|user|info}"
esac

exit 0
