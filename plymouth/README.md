update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/nhsbuntu-logo/nhsbuntu-logo.plymouth 100
update-alternatives --install /usr/share/plymouth/themes/text.plymouth text.plymouth /usr/share/plymouth/themes/nhsbuntu-text/nhsbuntu-text.plymouth 100
update-alternatives --config default.plymouth
update-alternatives --config text.plymouth
update-initramfs -u
