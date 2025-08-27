#!/usr/bin/bash

# Original script by @Aire-One (https://github.com/Aire-One)
# https://gist.github.com/Aire-One/c8ef8e1a380b7c824b3a2ee856107843
# Please support this user all you can. 
# Modified by @spiritualhost (I changed the name also, just to keep things consistent)

NAME="VM-name"

export QEMU_AUDIO_DRV=alsa
qemu-system-x86_64 \
    -enable-kvm \
    -machine type=q35,accel=kvm \
    -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time \
    -smp sockets=1,cores=4,threads=2 \
    -m 8G \
    -mem-prealloc \
    -device intel-iommu \
    -k fr \
    -soundhw ac97 \
    -drive file=disk.imgqcow2,if=virtio,format=qcow2 \
    -net user,smb=/ABSOLUTE/PATH/TO/SHARED/DIR \
    -net nic,model=virtio \
    -rtc clock=host,base=utc \
    -usbdevice tablet \
    -vga virtio \
    -display sdl,gl=on \
    -no-frame \
    -no-quit \
    -name "$NAME" 
