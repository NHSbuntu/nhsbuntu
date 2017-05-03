#! /bin/bash

# Install packer.io

# Check for packer
which packer.io > /dev/null 2>&1
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
  ln -s ~/bin/packer-${PACKERVERS} ~/bin/packer.io
  rm /tmp/packer_${PACKERVERS}_linux_amd64.zip
fi

exit 0
