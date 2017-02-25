## qemu-img

```
qemu-img create -f qcow2 nhsbuntu.img 8G
```

## qemu-system

```
qemu-system-x86_64 -enable-kvm -m 2048M -drive file=nhsbuntu.img,if=virtio,format=qcow2,media=disk -cdrom NHSbuntu-amd64-16.10.iso
```
