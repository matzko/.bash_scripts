# Installation

Add the following line to the end of ~/.bashrc :

	source ~/.bash_scripts/load.sh

Copy xbindkeysrc contents to ~/.xbindkeysrc 

disabling trackpad when plugging in  mouse for gnome:

gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

# checking on those settings:
gsettings get org.gnome.desktop.peripherals.touchpad send-events
