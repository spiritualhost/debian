#!/usr/bin/bash

#Load some other helpful functions from the installer script
source "configs/userinfo.sh"

#Create a baseline disk based on user configs
create_disk() {
    echo "Creating virtual hard disk '$1'..."
    qemu-img create -f qcow2 "$1" "$2" \
    && echo "Disk $1 of size $2 created." && logger "Disk $1 of size $2 created." \
    || fatalerror "Disk creation error."
}

#Creat a disk with user configs
create_disk $DISKNAME $DISKSIZE

## Testing below here

#Get a Debian ISO
wget  "https://cdimage.debian.org/cdimage/daily-builds/daily/arch-latest/amd64/iso-cd/debian-testing-amd64-netinst.iso"

#Filename set here with user config
FILENAME="$1.qcow"


#Boot the disk ("test")
qemu-system-x86_64 \
    -enable-kvm \
    -m "$MEMORY" \
    -boot d \
    -cdrom "debian-testing-amd64-netinst.iso"\
    -drive file="$FILENAME",format=qcow2
