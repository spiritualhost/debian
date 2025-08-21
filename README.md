### Ubuntu Server Installation Automation

A basic way of getting a Debian server up and running with minimal effort using past configuration settings. 


## What it does

Using a netinst Debian ISO (located https://www.debian.org/CD/netinst/), the script will take the onerous process of repeatedly setting up Debian machines and automate it. In my opinion, this is much quicker than repeatedly going through the graphical installer. The netinst was chosen because it represents a single CD which enables the installation of Debian, with all packages other than the base system being fetched over the internet. Because of this, a network connection, like Ethernet or WLAN is recommended. 

For the purposes of development, I used the netinst CD image for AMD64 (https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-13.0.0-amd64-netinst.iso). 

This is strongly inspired by Luke Smith's LARBS (https://github.com/LukeSmithxyz/LARBS) and mostly just seemed like a fun project to do. 


## Project Structure

```
ubuntu-installer/
├── installer.sh
├── modules/       # Optional scripts for each phase
├── configs/       # Default configs or templates
├── README.md
└── LICENSE
```


## How to run it

1) Go through the basic steps of the minimal installation. This can be done by clicking the "Install" option in the Debian bootable media.
2) 




## Tested Versions of Debian

- 


## Requirements

- Debian installation
- git
