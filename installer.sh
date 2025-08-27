#!/usr/bin/bash

#This line deliberately causes the script to fail if several issues arise, helps with fatalerror handling
#See https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425?permalink_comment_id=3935570

set -euxo pipefail

#Load config
source "./configs/userinfo.sh"

### Functions ###

#Ease of writing functions (repeated logic)

#Log errors to terminal and log file
#Log file name is defined in userinfo.sh
logger(){
    logfile=$LOGFILE
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$logfile"
}


#Error that stops script
fatalerror(){
    logger "FATAL: $1"
    exit 1
}


#Error that outputs to stderr and continues script (non-severe errors)
error(){
    logger "Non-Fatal Error: $1"
}


#Take in a response for "Are you sure" type questions so as to not need repeated case statement logic
confirmdecision(){
    while true; do
        case $1 in
            y|Y) return 0 ;;
            n|N) return 1 ;; 
            *) error "Bad response"; read -rp "Please enter y or n: " input; set -- "$input" ;;
        esac
    done
}


#Admin packages

#Check if root, on a Debian system, and with stable internet
#Sudo checks if root, apt-get checks if debian, --qq (update lists) checks if internet connection available
checkifroot(){
    sudo apt-get update -qq
    logger "Confirmation: user is root or has sudo permissions. Continuing execution of script."
}


#Install packages
#Attempt installations one at a time, which will log errors if one of the user-entered packages doesn't work
packageinstall(){
    echo "Installing package $1..." && logger "Installing package $1..." 
    sudo apt install -y $1
}


#Install user-provided scripts
scriptinstall(){
    echo "Installing script $1..." && logger "Installing script $1..."
    sudo chmod +x "$1"
    ./"$1"
}


#Clone config files from git repo provided in config page and then overwrite basic config files for new installation in ~/.config
#This function is still in progress
configsetup(){
    git clone $1
    repo_name=$(echo "$path" | sed 's/.*\/\([^.]*\)\..*/\1/') #Extracts the actual name of the folder
    cd "$repo_name"
    pwd
    cd ".."
    #Here cd into the repo, go through the configs and move them to the proper place, etc, etc, etc. 
}


#Desktop environment (optional)
#https://wiki.debian.org/DesktopEnvironment
desktopenv(){
    logger "Installing the $DESKTOP_ENV desktop environment."
    sudo tasksel install "$DESKTOP_ENV"
}



### The Script ###

#Check if user is root
checkifroot || fatalerror "Are you running this as root, on a Debian system, with a stable internet connection?"

echo "Welcome to Debian Setup Automation. After username and password, the script pretty much runs itself. Errors and logs will be output to $LOGFILE."

#Get the user password in case needed later
read -rp "Please enter the password for user $USERNAME: " PASSWORD

read -rp "The provided password is '$PASSWORD'. This will not be saved. Is that correct (y/n): " choice
(confirmdecision "$choice" && echo "User confirmed") || fatalerror "User canceled."  

#

#Loop through user-provided array of packages to install one at a time (errors will be thrown for unfindable packages)

packageslength=${#PACKAGES[@]}

for (( i = 0; i < packageslength; i++ ))
do
    currentpackage=${PACKAGES[$i]}
    packageinstall "$currentpackage" || error "Error in installing package ${PACKAGES[$i]}. Does the package exist?"
done

#Install desktop environment if variable has been specified in userinfo.sh

if [[ -n "${DESKTOP_ENV:-}" ]]; then
    echo "You've opted in to installing a desktop environment ($DESKTOP_ENV). Now opening setup window."
    desktopenv "$DESKTOP_ENV" || fatalerror "Failure installing desktop environment."
else
    echo "No desktop environment selected. Moving on."
fi


#Overwrite basic config files in ~/.config
#this section is currently in progress
ls ~/.config

#if [[ -n "${DOTFILES_REPO:-}" ]]; then
#    echo "Copying config files from $DOTFILES_REPO..."
#    configsetup "$DOTFILES_REPO" || fatalerror "Error in setting up config. Does the provided git repo exist?"
#else
#    echo "No config files provided. Moving on."
#fi



#Install user-specified scripts

##Probably a similar logic to the above functions, maybe an array like with the packages

scriptslength=${#SCRIPTS[@]}

if [ "$scriptslength" -gt 0 ]; then
    echo "Installing user-provided scripts..."
    cd "user-scripts/"
    for (( i = 0; i < scriptslength; i++ )); do
        currentscript=${SCRIPTS[$i]}
        if [ ! -f "$currentscript" ]; then
            error "Script ${SCRIPTS[$i]} does not exist in user-scripts/. It may need to be moved to that folder."
        else
            scriptinstall "$currentscript" || error "Error executing script $currentscript. Script may need a matching shebang."
        fi
    done
    cd ".."
else
    echo "No user scripts provided, moving on."
fi


#Last message -- Installed Successfully
read "Successful installation. Would you like to reboot the system (y/n): " choice
confirmdecision $choice && sudo reboot || echo "Script completed. Thank you for using!" 