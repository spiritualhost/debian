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

#Check if root, on a Debian system, and with stable internet
#Sudo checks if root, apt-get checks if debian, --qq (update lists) checks if internet connection available
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
#https://wiki.debian.org/DesktopEnvironment
desktopenv(){
    sudo tasksel
}




### The Script ###

#Check if user is root
checkifroot || error "Are you running this as root, on a Debian system, with a stable internet connection?"




echo "Welcome to Debian Setup Automation. Some prompts may require input, so please keep somwhat of an eye on the terminal during runtime."

read -rp "Please enter the password for user $USERNAME: " PASSWORD

read -rp "The provided password is '$PASSWORD'. Is that correct (y/n): " choice
confirmdecision "$choice"


#Loop through user-provided array of packages to install one at a time (errors will be thrown for unfindable packages)
packageslength=${#PACKAGES[@]}

for (( i = 0; i < packageslength; i++ ))
do
    currentpackage=${PACKAGES[$i]}
    packageinstall "$currentpackage"
done


#Install desktop environment if variable has been specified in userinfo.sh

if [[ -n "${DESKTOP_ENV:-}" ]]; then

    echo "You've opted in to installing a desktop environment. Now opening setup window."

    desktopenv "$DESKTOP_ENV" || error "Failure installing desktop environment."

else

    echo "No desktop environment selected. Moving on."

fi


#Overwrite basic config files in ~/.config
ls ~/.config
