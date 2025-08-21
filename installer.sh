#!/usr/bin/bash

#This line deliberately causes the script to fail if several issues arise, helps with error handling
#See https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425?permalink_comment_id=3935570

set -euxo pipefail

#Load config
source ./configs/userinfo.sh

### Functions ###

#Ease of writing functions (repeated logic)

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
                ;;
        esac
    fi

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

echo "Welcome to Debian Setup Automation. Some prompts may require input, so please keep somwhat of an eye on the terminal during runtime."

read -rp "Please enter the password for user $USERNAME: " PASSWORD

read -rp "The provided password is '$PASSWORD'. Is that correct (y/n): " choice
confirmdecision "$choice"

checksudo

packageinstall "vim"












#Finally, enter the root shell to check over the setup before rebooting
echo "Entering root shell..."
su --login