#!/usr/bin/bash

#This line deliberately causes the script to fail if several issues arise, helps with error handling
#See https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425?permalink_comment_id=3935570

set -euxo pipefail

#Load config
source ./configs/userinfo.sh

### Functions ###

#Ease of writing functions (repeated logic)

#Log to stderr and exit with failure
error(){
    printf "%s\n" "$1" >&2
    exit 1
}


#Take in a response for "Are you sure" type questions so as to not need repeated case statement logic
confirmdecision(){
    case $1 in
        "y")
            echo "y"
            ;;
        "n")
            echo "n"
            ;;
        *)
            echo "Bad response"
            error
        ;;
    esac
}




#Admin packages
#Check if sudo is available, then prompt to set up if not
#https://wiki.debian.org/sudo/

checksudo(){

    if ( which sudo ) ; then
        echo "Sudo has been set up on this system."
        su --login
        
    else
        read -rp "Sudo has not been set up on this system, would you like to use it (y/n): "  choice

        case "$choice" in
            "y")
                echo "Setting up sudo..."
                su -c "echo Logged in as root... Installing the sudo package... && apt update && apt install sudo && adduser $USERNAME sudo"
                ;;
            "n")
                echo "You have selected NO."
                ;;
            *)
                echo "Unrecognized response."
                error
                ;;
        esac
    fi

}


#Check if root, on a Debian system, and with stable internet
checkifroot(){
    sudo apt-get update -qq
}




#Install packages
#$1 is assumed to be a package
#Attempt installations one at a time, which will log errors if one of the user-entered packages doesn't work
packageinstall(){
    echo "Installing package $1..."
    sudo apt install -y $1
}



#Overwrite basic config files in ~/.config
configsetup(){
    echo
}


#Desktop environment (optional)

desktopenv(){
    echo
}




### The Script ###

#Check if user is root
checkifroot || error "Are you running this as root, on a Debian system, with a stable internet connection?"




echo "Welcome to Debian Setup Automation. Some prompts may require input, so please keep somwhat of an eye on the terminal during runtime."

read -rp "Please enter the password for user $USERNAME: " PASSWORD

read -rp "The provided password is '$PASSWORD'. Is that correct (y/n): " choice
confirmdecision "$choice"

#Function being troublesome, come back to this later
#checksudo


#Loop through user-provided array of packages to install one at a time (errors will be thrown for unfindable packages)
packageslength=${#PACKAGES[@]}

for (( i = 0; i < packageslength; i++ ))
do
    currentpackage=${PACKAGES[$i]}
    packageinstall "$currentpackage"
done






#Install desktop environment

######



#Overwrite basic config files in ~/.config

ls ~/.config
