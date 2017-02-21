#!/bin/bash

full_version=$(cat /usr/share/gnome/gnome-version.xml)
major_version=$(echo $full_version | grep -oPm1 "(?<=<platform>)[^<]+")
minor_version=$(echo $full_version | grep -oPm1 "(?<=<minor>)[^<]+")
minor_version=${minor_version::-1}
total_version=$major_version.$minor_version
# echo $major_version
# echo $minor_version
# echo $total_version

# Install "Windows is ready notification remover"
wget -O /tmp/extension.zip "https://extensions.gnome.org/download-extension/windowIsReady_Remover@nunofarruca@gmail.com.shell-extension.zip?version_tag=5690"
mkdir -p "$HOME/.local/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com"
unzip /tmp/extension.zip -d "$HOME/.local/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com"
rm /tmp/extension.zip

# Install "Drop down terminal"
wget -O /tmp/extension.zip "https://extensions.gnome.org/download-extension/drop-down-terminal@gs-extensions.zzrough.org.shell-extension.zip?version_tag=6546"
mkdir -p "$HOME/.local/share/gnome-shell/extensions/drop-down-terminal@gs-extensions.zzrough.org"
unzip /tmp/extension.zip -d "$HOME/.local/share/gnome-shell/extensions/drop-down-terminal@gs-extensions.zzrough.org"
rm /tmp/extension.zip

# Install "No topleft hot corner"
wget -O /tmp/extension.zip "https://extensions.gnome.org/download-extension/nohotcorner@azuri.free.fr.shell-extension.zip?version_tag=6264"
mkdir -p "$HOME/.local/share/gnome-shell/extensions/nohotcorner@azuri.free.fr"
unzip /tmp/extension.zip -d "$HOME/.local/share/gnome-shell/extensions/nohotcorner@azuri.free.fr"
rm /tmp/extension.zip

# Install "Places status indicator"
mkdir -p "$HOME/.local/share/gnome-shell/extensions/places-menu@gnome-shell-extensions.gcampax.github.com"
unzip /tmp/extension.zip -d "$HOME/.local/share/gnome-shell/places-menu@gnome-shell-extensions.gcampax.github.com"
rm /tmp/extension.zip

# Install "Remmina search provider"
wget -O /tmp/extension.zip "https://extensions.gnome.org/download-extension/remmina-search-provider@alexmurray.github.com.shell-extension.zip?version_tag=6211"
mkdir -p "$HOME/.local/share/gnome-shell/extensions/remmina-search-provider@alexmurray.github.com"
unzip /tmp/extension.zip -d "$HOME/.local/share/gnome-shell/remmina-search-provider@alexmurray.github.com"
rm /tmp/extension.zip

# Removable drive menu"
wget -O /tmp/extension.zip "https://extensions.gnome.org/download-extension/drive-menu@gnome-shell-extensions.gcampax.github.com.shell-extension.zip?version_tag=5759"
mkdir -p "$HOME/.local/share/gnome-shell/extensions/drive-menu@gnome-shell-extensions.gcampax.github.com"
unzip /tmp/extension.zip -d "$HOME/.local/share/gnome-shell/drive-menu@gnome-shell-extensions.gcampax.github.com"
rm /tmp/extension.zip



test=$(gsettings get org.gnome.shell enabled-extensions)
echo $test


gsettings set org.gnome.shell enabled-extensions "['drop-down-terminal@gs-extensions.zzrough.org', 'nohotcorner@azuri.free.fr', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'windowIsReady_Remover@nunofarruca@gmail.com', 'remmina-search-provider@alexmurray.github.com', 'removeaccesibility@lomegor']"
