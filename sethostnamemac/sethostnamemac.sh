#!/bin/bash
hostnamemac=$(ip link show wlan0 | awk '/ether/ {gsub(":","",$2); print $2}')
raspi-config nonint do_hostname "$hostnamemac"
hostname -b "$hostnamemac"
systemctl restart avahi-daemon
