#! /bin/bash

# Install Remmina from PPA

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
