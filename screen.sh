#!/bin/sh
current=$(pwd)
cd /home/pi/test/version1/Wakey_shell
screen -S reactsession -d -m -- sh -c 'sh getRFIDmonitor.sh'
screen -S realtime -d -m -- sh -c 'sh control.sh'
cd /home/pi/Wakey
screen -S RFID -d -m -- sh -c 'python rtTagID.py'
cd ${current}
