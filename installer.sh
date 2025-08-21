#!/usr/bin/env bash

#This line deliberately causes the script to fail if several issues arise, helps with error handling
#See https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425?permalink_comment_id=3935570

set -euxo pipefail

### Functions ###

#Admin packages
#Check if sudo is available, then prompt to set up if not

checksudo(){

    if ( which sudo ) ; then
        read -p "Sudo has been set up on this system, would you like to use it (y/n): "  choice

        case $choice in
            "y")
                echo "You have selected YES."
                ;;
            "n")
                echo "You have selected NO."
                ;;
            *)
                echo "Unrecognized response."
                ;;
        esac
        
    else
        read -p "Sudo has not been set up on this system, would you like to use it (y/n): "  choice

        case $choice in
            "y")
                echo "You have selected YES."
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


}


#Install packages
packageinstall(){



}



#Overwrite basic config files in ~/.config
configsetup(){


}


#Desktop environment (optional)











### The Script ###

checksudo
