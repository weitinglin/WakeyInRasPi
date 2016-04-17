#!/bin/sh
current=$(pwd)

cd ./eventType02

for item in  $(cut -d " " -f 1 Type2recording.txt )
do
 url=$( grep ${item} Type2recording.txt | cut -d " " -f 12)
 wget -O event/recording/${item}.wav $url
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer ./eventType02/event/recording/${temp}.wav  >> event/${item}.sh

done

cd ${current}
