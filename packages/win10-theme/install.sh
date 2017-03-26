#! /bin/bash

wget https://github.com/B00merang-Project/Windows-10/archive/master.zip -O Windows-10-master.zip
wget https://github.com/B00merang-Project/Windows-10-icons/archive/master.zip -O Windows-10-Icons-master.zip
unzip Windows-10-master.zip
unzip Windows-10-Icons-master.zip
mv Windows-10-master /usr/share/themes
mv Windows-10-Icons-master /usr/share/icons
rm Windows-10-master.zip
rm Windows-10-Icons-master.zip

cat <<EOF >>win10.xml
[/]
gtk-im-module='gtk-im-context-simple'
icon-theme='Windows-10-Icons-master'
gtk-theme='Windows-10-master'
toolkit-accessibility=false
EOF
cat win10.xml | dconf load /org/gnome/desktop/interface/
rm win10.xml
