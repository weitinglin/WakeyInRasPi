#!/bin/sh
#echo $1
#echo $2
userID="0"
scheduleID=$(date "+%Y%m%d")
#echo ${scheduleID}
#userID 1 date 20160329
#modify the userID
sed -i -e '2s/[[:digit:]][[:digit:]]*/'$userID'/g' getMySQLreactMusic.php
#cat practice.txt > getMySQLrealTimeTalk.php
#modify the date
sed -i -e '3s/[[:digit:]][[:digit:]]*/'$scheduleID'/g' getMySQLreactMusic.php
#modify the userID
sed -i -e '2s/[[:digit:]][[:digit:]]*/'$userID'/g' getMySQLreactText.php
#cat practice.txt > getMySQLrealTimeTalk.php
#modify the date
sed -i -e '3s/[[:digit:]][[:digit:]]*/'$scheduleID'/g' getMySQLreactText.php

sed -i -e '2s/[[:digit:]][[:digit:]]*/'$userID'/g' getMySQLreactRecording.php
#cat practice.txt > getMySQLrealTimeTalk.php
#modify the date
sed -i -e '3s/[[:digit:]][[:digit:]]*/'$scheduleID'/g' getMySQLreactRecording.php
#print the list
#php getMySQLevent.php
#update the database
#php updateMySQLevent.php
#php
