#!/usr/bin/bash

#Load some other helpful functions from the installer script
source "configs/userinfo.sh"

#Filename set here with user config
FILENAME="$DISKNAME.qcow"

#Create a baseline disk based on user configs
create_disk() {
    echo "Creating virtual hard disk '$1'..."
    qemu-img create -f qcow2 "$1" "$2" \
    && echo "Disk $1 of size $2 created." && logger "Disk $1 of size $2 created." \
    || fatalerror "Disk creation error."
}

#Creat a disk with user configs
create_disk $FILENAME $DISKSIZE

## Testing below here

#Get a Debian ISO
wget  "https://cdimage.debian.org/cdimage/daily-builds/daily/arch-latest/amd64/iso-cd/debian-testing-amd64-netinst.iso"

#Boot the disk ("test")
qemu-system-x86_64 \
    -m "$MEMORY" \
    -smp "$CPUS" \
    -boot d \
    -cdrom "debian-testing-amd64-netinst.iso"\
    -drive file="$FILENAME",format=qcow2 \
    -nic user \
    -display sdl

#Cleanup Debian ISO(s)
sudo rm "debian-testing-amd64-netinst.iso*"