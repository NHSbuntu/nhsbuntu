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
export PACKERVERS=1.0.0
export VAGRANTVERS=1.9.4
export VBOXLATEST=`curl -sS http://download.virtualbox.org/virtualbox/LATEST.TXT`

case "$1" in
      developer)
      check_deps
      ./packer.sh
      ./virtualbox.sh
      ./vagrant.sh
      ./remmina.sh
      ;;
      user)
      check_deps
			./virtualbox.sh
      ./vagrant.sh
      ./remmina.sh
			;;
       *)
      echo "Usage: $0 {developer|user}"
esac

exit 0
