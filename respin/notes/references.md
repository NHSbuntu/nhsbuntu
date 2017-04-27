## Build Package
$ ~/Development/nhsbuntu-project/nhsbuntu-default-settings $ dpkg-buildpackage

## ubuntu-defaults-image
/usr/bin/ubuntu-defaults-image

## live-build
sudo LB_ISO_TITLE="NHSbuntu" LB_ISO_VOLUME="NHSbuntu Xenial $(date +%Y%m%d-%H:%M)" ubuntu-defaults-image --ppa nhsbuntu/ppa --release xenial --flavor ubuntu-gnome --package nhsbuntu-default-settings

## ubuntu-defaults-builder package in Ubuntu
https://launchpad.net/ubuntu/+source/ubuntu-defaults-builderhttps://launchpad.net/ubuntu/+source/ubuntu-defaults-builder

## lp:ubiquity-slideshow-ubuntu
https://code.launchpad.net/~ubiquity-slideshow/ubiquity-slideshow-ubuntu/html

## refs
https://lists.ubuntu.com/archives/ubuntu-devel/2014-November/038537.html
http://manpages.ubuntu.com/manpages/trusty/man1/lb_config.1.html

## ubuntu gnome default settings
http://packages.ubuntu.com/source/xenial/ubuntu-gnome-default-settings
