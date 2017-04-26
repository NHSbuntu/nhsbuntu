## qemu-img

```
qemu-img create -f qcow2 nhsbuntu.img 16G
```

## qemu-system

```
qemu-system-x86_64 -enable-kvm -m 2048M -drive file=nhsbuntu.img,if=virtio,format=qcow2,media=disk -cdrom NHSbuntu-amd64-16.10.iso
```




#!/bin/sh
export QEMU_AUDIO_DRV=alsa
DISKIMG=win7-hda1.img
WIN7IMG=win7.iso
VIRTIMG=virtio-win-0.1-135.iso
qemu-system-x86_64 --enable-kvm -drive file=${DISKIMG},if=virti,format=qcow2,media=disko -m 2048 \
-net nic,model=virtio -net user -cdrom ${WIN7IMG} \
-drive file=${VIRTIMG},index=3,media=cdrom \
-rtc base=localtime,clock=host -smp cores=2,threads=4 \
-usbdevice tablet -soundhw ac97 -cpu host -vga vmware
