#!/bin/sh
A=$(sh getMySQLrealTime.sh)
if [ $A = "" ]
then
 echo "no" 
else
sh getMySQLrealTime.sh > realTimeTalk.txt;
sh getTextToApi.sh;
sh SetAction.sh;
echo "" > realTimeTalk.txt;
echo "" > tempSoundlist.txt;
php -f updateMySQLrealTimeTalk.php;
echo "finish!"
fi
