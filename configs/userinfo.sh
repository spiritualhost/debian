#!/usr/bin/bash

#User info that will be source'd in the main script to make it easier on repeated runs
#User passwords will not be stored
# User info
USERNAME="ryan"


# System info

#DE Choices:
## desktop - debian desktop environment
## gnome-desktop - GNOME
## xfce-desktop - Xfce
## gnome-flashback-desktop - GNOME Flashback
## kde-desktop - KDE Plasma
## cinnamon-desktop - Cinnamon
## mate-desktop - MATE
## lxde-desktop - LXDE
## lxqt-desktop - LXQT
## web-server - web server
## ssh-server - SSH server
## laptop - laptop
## blendsel - Choose a Debian Blend for installation

##Multiple tasks can be installed at once if you format as 'DESKTOP_ENV="gnome web-server"', for example

##Leave empty for nothing

DESKTOP_ENV="kde-desktop" 



#***Possibly get these ones set up later?
#HOSTNAME="my-server"
#TIMEZONE="America/New_York"


# Dotfiles

##Leave empty for nothing

##The below link is just for testing purposes

DOTFILES_REPO="https://github.com/spiritualhost/Various-Useful-Scripts.git"


# Packages
# Personalized package list can be copied and pasted over PACKAGES here
PACKAGES=(
"adduser" "apt" "apt-utils" "base-files" "base-passwd" "bash" "bsdutils" "coreutils" "cpio" "cron" "cron-daemon-common" "dash" "dbus" "dbus-bin" "dbus-daemon" "dbus-session-bus-common" "dbus-system-bus-common" "debconf" "debconf-i18n" "debian-archive-keyring" "debianutils" "diffutils" "dmidecode" "dmsetup" "dpkg" "e2fsprogs" "fdisk" "findutils" "gcc-12-base" "gpgv" "grep" "gzip" "hostname" "ifupdown" "init" "init-system-helpers" "iproute2" "iputils-ping" "isc-dhcp-client" "isc-dhcp-common" "kmod" "less" "libacl1" "libapparmor1" "libapt-pkg6.0" "libargon2-1" "libattr1" "libaudit-common" "libaudit1" "libblkid1" "libbpf1" "libbsd0" "libbz2-1.0" "libc-bin" "libc-l10n" "libc6" "libcap-ng0" "libcap2" "libcap2-bin" "libcom-err2" "libcrypt1" "libcryptsetup12" "libdb5.3" "libdbus-1-3" "libdebconfclient0" "libdevmapper1.02.1" "libedit2" "libelf1" "libexpat1" "libext2fs2" "libfdisk1" "libffi8" "libgcc-s1" "libgcrypt20" "libgmp10" "libgnutls30" "libgpg-error0" "libgssapi-krb5-2" "libhogweed6" "libidn2-0" "libip4tc2" "libjansson4" "libjson-c5" "libk5crypto3" "libkeyutils1" "libkmod2" "libkrb5-3" "libkrb5support0" "liblocale-gettext-perl" "liblz4-1" "liblzma5" "libmd0" "libmnl0" "libmount1" "libncursesw6" "libnettle8" "libnewt0.52" "libnftables1" "libnftnl11" "libp11-kit0" "libpam-modules" "libpam-modules-bin" "libpam-runtime" "libpam-systemd" "libpam0g" "libpcre2-8-0" "libpopt0" "libproc2-0" "libreadline8" "libseccomp2" "libselinux1" "libsemanage-common" "libsemanage2" "libsepol2" "libslang2" "libsmartcols1" "libss2" "libssl3" "libstdc++6" "libsystemd-shared" "libsystemd0" "libtasn1-6" "libtext-charwidth-perl" "libtext-iconv-perl" "libtext-wrapi18n-perl" "libtinfo6" "libtirpc-common" "libtirpc3" "libudev1" "libunistring2" "libuuid1" "libxtables12" "libxxhash0" "libzstd1" "locales" "login" "logrotate" "logsave" "mawk" "mount" "nano" "ncurses-base" "ncurses-bin" "netbase" "nftables" "passwd" "perl-base" "procps" "readline-common" "sed" "sensible-utils" "sudo" "systemd" "systemd-sysv" "sysvinit-utils" "tar" "tasksel" "tasksel-data" "tzdata" "udev" "usr-is-merged" "util-linux" "util-linux-extra" "vim-common" "vim-tiny" "whiptail" "zlib1g"
)


#User scripts
#Logic should go somewhere down here -- it should be an array of ***filenames*** for scripts in the scripts directory (.\scripts)
#The array should like something like SCRIPTS=("testscript.sh")
#There's probably a better way to do this, but this implementation is just to get the script functional.

SCRIPTS=("testscript.sh")

