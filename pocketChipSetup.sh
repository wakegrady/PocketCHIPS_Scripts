#!/bin/bash

# Import our functions
source util/utilFunctions.sh

source install/installSamba.sh
source install/installPocketHome.sh
source install/installDoom.sh
source install/installQuake3.sh
source install/installMednafen.sh

# This will be the initial set up script for pocket chip

# Welcome the user, Possibly put a cool banner here one day
print-spacing
e_header "Welcome to the torch2424 pocket chip setup script!"
print-spacing

# Ask for sudo (To install packages and update)
e_warning "This script will need superuser access to run things like apt-get."
get-sudo

# Update/Upgrade the chip, and install dependencies for this script
print-spacing
e_arrow "Updating/Upgrading/Dependencies pocket chip"
e_note "This is highly suggested if this is the first time installing packages with the device, or the first time using this script"
seek_confirmation "Would you like to Updating/Upgrading/Dependencies pocket chip?"
if is_confirmed; then
    e_bold "Updating/Upgrading pocket chip..."
    command-delay
    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get install -y ssh git sed
else
  e_bold "Installation skipped"
fi

#Inform of swtiching to user input
print-spacing
e_warning "Now prompting for optional packages. These can be installed individually with the scripts in this repo."

#Install Marshamallow, a much better home screen replacement
#https://bbs.nextthing.co/t/pocket-home-marshmallow-edition/6579
print-spacing
e_arrow "Pocket Home (Marshmallow Edition)"
e_note "This is highly suggested. It will greatly expand your homescreen functionality."
e_note "Pocket Home Marshmallow Edition can be found at: https://bbs.nextthing.co/t/pocket-home-marshmallow-edition/6579"
seek_confirmation "Would you like to install Pocket Home (Marshmallow Edition)?"
if is_confirmed; then
    e_bold "Installing Pocket Home (Marshmallow Edition)..."
    command-delay
    install-pocket-home
else
  e_bold "Installation skipped"
fi

#SURF_AGENT user agent string
#To allow surf web browser to browse mobile
#Similar to this: https://bbs.nextthing.co/t/better-web-browsing-from-surf/9469/4
#Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19
print-spacing
e_arrow "Surf Web Browser: Mobile User Agent"
e_note "The default web browser for pocket chip is surf (e.g surf google.com). However, it shows websites as a desktop computer."
e_note "This will add a android Nexus S user agent string to your browser to make sites mobile"
seek_confirmation "Would you like to install a surf user agent string?"
if is_confirmed; then
    e_bold "Installing surf user agent string..."
    command-delay
    echo  'export SURF_USERAGENT="Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19"' >> /home/chip/.bashrc
else
  e_bold "Installation skipped"
fi

#Samba Server (For Easy file transfer)
#https://bbs.nextthing.co/t/chip-nas-network-attached-storage/1685/2
print-spacing
e_arrow "Samba Server"
e_note "This will install a Samba server, which will make it very easy to view/transfer files over a newtork"
e_note "It will be accessible at smb://chip"
seek_confirmation "Would you like to install a Samba server?"
if is_confirmed; then
    e_bold "Installing Samba Server..."
    command-delay
    install-samba
else
  e_bold "Installation skipped"
fi

#Install Doom
#http://blog.nextthing.co/customize-the-hell-out-of-your-pocketc-h-i-p-install-doom-give-it-an-icon-on-the-home-screen/
print-spacing
e_arrow "Doom"
e_note "Next Thing Co. Doom Install found at: https://bbs.nextthing.co/t/pocket-home-marshmallow-edition/6579"
seek_confirmation "Would you like to install Doom?"
if is_confirmed; then
    e_bold "Installing Doom..."
    command-delay
    install-doom
else
  e_bold "Installation skipped"
fi

#Install Quake III
#http://blog.nextthing.co/accelerate-your-3d-gaming-with-quake-iii-on-pocketc-h-i-p/
print-spacing
e_arrow "Quake III"
e_note "Next Thing Co. Quake III Install found at: http://blog.nextthing.co/accelerate-your-3d-gaming-with-quake-iii-on-pocketc-h-i-p/"
seek_confirmation "Would you like to install Quake III?"
if is_confirmed; then
    e_bold "Installing Quake III"
    command-delay
    install-quake-3
else
  e_bold "Installation skipped"
fi

#Install Mednafen
#https://bbs.nextthing.co/t/mednafen-emulator-configuration-gbc-gba-snes-nes/5027
#Coming Soon!

#Install playstation
#http://blog.nextthing.co/community-project-emulate-the-playstation-on-your-pocketc-h-i-p/
#Coming soon!

#Install Quake II
#https://bbs.nextthing.co/t/quake2-on-the-pocketc-h-i-p/9291
#Possibly coming?

#Custom MOTD
#http://blog.nextthing.co/3-new-community-tutorials-play-openrct2-chat-with-pidgin-and-customize-your-motd/
#http://www.linuxjournal.com/content/tech-tip-using-figlet-spice-your-scripts
#Coming soon!
