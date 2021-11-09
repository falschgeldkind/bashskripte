#!/bin/bash
### Adds a script to autostart on login into GNOME

path_to_script=/PATH/TO/SCRIPT.sh
script=$(basename $path_to_script)

# Adding directories for autostart files and config scripts 
mkdir -p /etc/skel/.config/autostart/
mkdir -p /usr/local/user-config

# Copying the script to it's destination and making it executable
cp $path_to_script /usr/local/user-config/
chmod +x /usr/local/user-config/$script

cat >/etc/skel/.config/autostart/UCS.desktop <<__EOF__
[Desktop Entry]
Type=Application
Exec=bash /usr/local/user-config/$script
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[de_DE]=UCS
Name=UCS
Comment[de_DE]=
Comment=
__EOF__
