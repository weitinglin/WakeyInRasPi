#!/bin/sh
#echo $1
#echo $2
userID="0"
date=$(date "+%Y%m%d")
#userID 1 date 20160329
#modify the userID
sed -i -e '2s/[[:digit:]][[:digit:]]*/'$userID'/g' getMySQLrealTimeTalk.php
#cat practice.txt > getMySQLrealTimeTalk.php
#modify the date
sed -i -e '3s/[[:digit:]][[:digit:]]*/'$date'/g' getMySQLrealTimeTalk.php
#modify the userID in updateMySql
sed -i -e '2s/[[:digit:]][[:digit:]]*/'$userID'/g' getMySQLrealTimeMusic.php
#cat practice.txt > getMySQLrealTimeTalk.php
#modify the date in updateMySql
sed -i -e '3s/[[:digit:]][[:digit:]]*/'$date'/g' getMySQLrealTimeMusic.php

sed -i -e '2s/[[:digit:]][[:digit:]]*/'$userID'/g' getMySQLrealTimeMotion.php
#cat practice.txt > getMySQLrealTimeTalk.php
#modify the date in updateMySql
sed -i -e '3s/[[:digit:]][[:digit:]]*/'$date'/g' getMySQLrealTimeMotion.php
#php -f  getMySQLrealTimeTalk.php
#php updateMySQLrealTimeTalk.php
