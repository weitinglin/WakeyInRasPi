#!/bin/sh
Signal=$(head -n1 signal.txt)
while [ -n $Signal ]
do
 A=$(php -f getMySQLrealTimeTalk.php)
 if [ -z $A ]
  then
  echo "no" 
  else
   php -f getMySQLrealTimeTalk.php > realTimeTalk.txt;
   sh getTextToApi.sh;
   sh SetAction.sh;
   echo "" > realTimeTalk.txt;
   php -f updateMySQLrealTimeTalk.php;
   echo "finish!"
   rm wav/*.wav
  fi
done

