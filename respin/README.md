## Build Instructions (WIP)

Ensure you have `dpkg-dev` `syslinux-utils` `ubuntu-defaults-builder` installed:

`sudo apt install -y ubuntu-defaults-builder syslinux-utils dpkg-dev`

Create a directory for the eventual image ISO

`mkdir nhsbuntu-default-images`

Clone the NHSbuntu default settings from GitHub (this will create another directory called nhsbuntu-default-**settings**)

`git clone git@github.com:open-health-hub/nhsbuntu-default-settings.git`

Enter the default settings directory

`cd nhsbuntu-default-settings`

Build the package lists whicih will be used to build the ISO in a moment

`dpkg-buildpackage`

move into the images directory

`cd ../nhsbuntu-default-image`

Start the ISO building (takes 5-10 minutes, possibly more depending on your download speed and local machine performance)

`sudo ubuntu-defaults-image --package ../nhsbuntu-default-settings_0.1_all.deb --keep-apt --release xenial --flavor ubuntu-gnome`

Wait for the downloads and building to complete

You should now have 2 large ISO files in the nhsbuntu-default-images directory.


### Testing/experimentation with the ISO in Virtualbox

### Burning to a CD/DVD/USB


## Resources we used in the creation of NHSbuntu

How to change Live CD splash screen - http://askubuntu.com/questions/10258/how-to-change-live-cd-splash-screen

Can I build a Ubuntu ISO from a manifest? http://askubuntu.com/questions/83617/can-i-build-a-ubuntu-iso-from-a-manifest

Trying to create custom plymouth theme in 16.04 - https://ubuntuforums.org/showthread.php?t=234

How to Customize an Ubuntu Installation Disc – The Right Way (16.04 Compatible!) - https://nathanpfry.com/how-to-customize-an-ubuntu-installation-disc/

Building Your Own Custom Ubuntu: Page 2 - http://www.datamation.com/open-source/building-your-own-custom-ubuntu-2.html

Creating Your Own Distributable Ubuntu DVD (Relinux) - https://www.howtoforge.com/creating-your-own-distributable-ubuntu-dvd-relinux

How to use Cubic to create a custom Ubuntu live CD image? - http://askubuntu.com/questions/741753/how-to-use-cubic-to-create-a-custom-ubuntu-live-cd-image

Ubuntu Live CD remastering tool - https://github.com/clearkimura/Customizer

Generate md5 checksum for all files in a directory - http://askubuntu.com/questions/318530/generate-md5-checksum-for-all-files-in-a-directory

Convert PNG to 8-Bit Palette BMP - http://www.imagemagick.org/discourse-server/viewtopic.php?t=27424
