#!/bin/sh
current=$(pwd)
cd /home/pi/test/version1/Wakey_shell
echo execute success
screen -S getMySQLreact -d -m -- sh -c 'sh getMySQLreact.sh'
screen -S reactControlAll -d -m -- sh -c 'sh getMySQLreactControlAll.sh'
screen -S getMySQLreal -d -m -- sh -c 'sh getMySQLrealTime.sh'
echo edn
cd ${current}
