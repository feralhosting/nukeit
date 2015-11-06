#!/bin/bash
# Nuke it, baby
#
# You can enter your protected servers here so that slots on this server are immune to the script. It is unlikely to have multiple slots per server for a user.
protected=("metis" "asteria")
#
if [[ "$(hostname)" = "$(echo ${protected[@]} | grep -o $(hostname))" ]]
then
    echo
    echo -e "\033[32m""This is the protected""\e[0m" "\033[31m""$(echo ${protected[@]} | grep -o $(hostname))""\e[0m" "\033[32m""slot, I am exiting""\e[0m"
    echo
    exit
fi
#
areyoursure=""
#
echo
echo -e "You are about to nuke" "\033[31m""$(hostname)""\e[0m"
echo
read -ep "Are you sure you want to nuke this slot: $(hostname)? [y]es or [n]o: " areyoursure
echo
    #
    if [[ "$areyoursure" =~ ^[Yy]$ ]]; then
    shopt -s dotglob
    rm -rf ~/*
    find . -delete
    #
    cp -f /etc/skel/.{bash_aliases,bash_logout,bashrc,profile} ~/
    chmod 644 ~/.{bash_aliases,bash_logout,bashrc,profile}
    #
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    wget -qO ~/.ssh/authorized_keys  http://git.io/vvpZA
    chmod 600 ~/.ssh/authorized_keys
    #
    mkdir -p ~/bin
    mkdir -p ~/.apache2/conf.d
    mkdir -p ~/private/
    mkdir -p ~/www/$(whoami).$(hostname -f)/public_html/
    ln -s ~/www/$(whoami).$(hostname -f) ~/www/$(whoami).$(hostname)
    #
    read -ep "Change password? [y/n]: " -i "n" changepass
    if [[ "$changepass" =~ ^[Yy]$ ]]
    then
        passwd
    fi
    #
    kill -9 -1
else
    echo -e "\033[31m""Nothing was changed.""\e[0m"
    echo
    exit
fi
#
