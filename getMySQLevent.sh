#!/bin/sh
#echo $1
#echo $2
userID="0"
scheduleID="20160415"

#userID 1 date 20160329
#modify the userID
sed -i -e '2s/[[:digit:]][[:digit:]]*/'$userID'/g' getMySQLevent.php
#cat practice.txt > getMySQLrealTimeTalk.php
#modify the date
sed -i -e '3s/[[:digit:]][[:digit:]]*/'$scheduleID'/g' getMySQLevent.php
#modify the userID
sed -i -e '2s/[[:digit:]][[:digit:]]*/'$userID'/g' updateMySQLevent.php
#cat practice.txt > getMySQLrealTimeTalk.php
#modify the date
sed -i -e '3s/[[:digit:]][[:digit:]]*/'$scheduleID'/g' updateMySQLevent.php
#print the list
#php getMySQLevent.php
#update the database
#php updateMySQLevent.php
#php
