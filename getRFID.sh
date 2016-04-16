#!/bin/sh

RFID=$(head -n 1 ../../../Wakey/rtTagIDTxt.txt  | sed 's/\(\[\|\]\)//g' | sed 's/,//g' |sed 's/  *//g' ) 
Event02=1941072298626

echo $RFID
echo $Event02

if [ $RFID = $Event02 ]
then
 for item in $(ls -l  eventType02/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
  done
fi
