#!/usr/bin/env bash

#This line deliberately causes the script to fail if several issues arise, helps with error handling
#See https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425?permalink_comment_id=3935570

set -euxo pipefail


### Functions ###

#Admin packages
#Check if sudo is available, then prompt to set up if not
#https://wiki.debian.org/sudo/

checksudo(){

    if ( which sudo ) ; then
        echo "Sudo has been set up on this system."
        su --login
        
    else
        read -p "Sudo has not been set up on this system, would you like to use it (y/n): "  choice

        case $choice in
            "y")
                echo "Setting up sudo..."
                su --login
                ## Enter the password of the root user as specified during install, then press enter
                echo "Logged in as root... Installing the sudo package..."
                apt install sudo
                #adduser jhon-smith sudo
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


# Update the system 
sysupdate(){
    echo
}


#Install packages
packageinstall(){
    echo
}



#Overwrite basic config files in ~/.config
configsetup(){
    echo
}


#Desktop environment (optional)











### The Script ###

echo "Welcome to Debian Setup Automation. Some prompts may require input, so please keep somwhat of an eye on the terminal during runtime."

checksudo

