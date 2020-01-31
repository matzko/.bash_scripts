# Installation

Add the following line to the end of ~/.bashrc :

	source ~/.bash_scripts/load.sh


Add this to ~/.byobu/.tmux.conf to default to zsh

```
set -g default-shell /usr/bin/zsh
set -g default-command /usr/bin/zsh
```

Add the following line to the end of ~/.zshrc :

	source ~/.bash_scripts/load-zsh.sh

Install the fonts in fonts:
GNOME Terminal (the default Ubuntu terminal): Open Terminal → Preferences and click on the selected profile under Profiles. Check Custom font under Text Appearance and select MesloLGS NF Regular.

```
  fonts/MesloLGS NF Bold Italic.ttf
  fonts/MesloLGS NF Bold.ttf
  fonts/MesloLGS NF Italic.ttf
  fonts/MesloLGS NF Regular.ttf
```



Copy xbindkeysrc contents to ~/.xbindkeysrc 

Copy .pryrc to the ruby project's directory

disabling trackpad when plugging in  mouse for gnome:

gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

# checking on those settings:
gsettings get org.gnome.desktop.peripherals.touchpad send-events
