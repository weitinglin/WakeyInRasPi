#!/bin/sh
SSID_name=$1
CODE=$2

touch temp.txt
echo network={                 >> temp.txt
echo        ssid=\"${1}\"	>> temp.txt
echo        psk=\"${2}\"        >> temp.txt
echo        key_mgmt=WPA-PSK 	>> temp.txt
echo }				>> temp.txt
#cat /etc//wpa_supplicant/wpa_supplicant.conf > backupwap_supplicant.conf
#cat temp.txt >> /etc/wpa_supplicant/wpa_supplicant.conf
#cat /etc//wpa_supplicant/wpa_supplicant.conf
rm temp.txt
