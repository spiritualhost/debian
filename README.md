### Debian Installation Automation

***This is currently in progress and doesn't work at all.***

A basic way of getting a Debian system up and running with minimal effort using past configuration settings. 


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

1) Go through the basic steps of the minimal installation. This can be done by clicking the "Install" option in the Debian bootable media. Before running anything else, run the following script line on your original system to get an overview of the packages needed:

```
echo "PACKAGES=($(apt-mark showmanual | sed 's/.*/\"&\"/' | tr '\n' ' '))"

```

This exact output should be pasted into the userinfo.sh file to replace the $PACKAGES variable &#8594; this will ensure that any packages the user installed on the original system will also be installed on the new setup.


2) Clone the repo somewhere convenient. I like to create a folder "~/builds" and then move to a better place later. After the repo has been cloned, you may need to make the script executable with:

```

chmod +x installer.sh

```

3) Run the script with:

```

./installer.sh

```




## Tested Versions of Debian

- 


## Requirements

- Debian installation
- git
