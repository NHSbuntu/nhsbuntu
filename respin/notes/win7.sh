#!/bin/sh
export QEMU_AUDIO_DRV=alsa
DISKIMG=win7-hda1.img
WIN7IMG=win7.iso
VIRTIMG=virtio-win-0.1.135.iso
qemu-system-x86_64 -enable-kvm -drive file=${DISKIMG},if=virtio,format=qcow2,media=disk -m 4096 -net nic,model=virtio -net user -cdrom ${WIN7IMG} -drive file=${VIRTIMG},index=3,media=cdrom -rtc base=localtime,clock=host -usbdevice tablet -soundhw ac97 -cpu host -vga cirrus
