#!/bin/bash

# Update system
apt update && apt -y upgrade && apt -y autoremove 

# Install package base
apt -y install neovim vlc htop neofetch openssh-server screen snapd gnome-tweaks ca-certificates git curl

# Install docker engine
install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# install mysql and mongo
docker pull mysql 
docker pull mongo

docker run --name mongodb -p 27017:27017 -d mongo
docker run --name mysql -p 8080:8080 -d mysql

# Configure Dock
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 36
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0

