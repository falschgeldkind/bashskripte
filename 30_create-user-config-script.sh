#!/bin/bash

mkdir -p /etc/skel/.config/autostart/
mkdir -p /usr/local/user-config
cp $path_rsc/user-config.sh /usr/local/user-config/
chmod +x /usr/local/user-config/user-config.sh

cat >/etc/skel/.config/autostart/UCS.desktop <<__EOF__
[Desktop Entry]
Type=Application
Exec=bash /usr/local/user-config/user-config.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[de_DE]=UCS
Name=UCS
Comment[de_DE]=
Comment=
__EOF__
