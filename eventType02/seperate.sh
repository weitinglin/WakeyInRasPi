#!/bin/sh
current=$(pwd)
cd ./eventType02
rm Type1text.txt
cat eventType${1}.txt | grep "actionType 1" > Type1text.txt
rm Type2recoding.txt
cat eventType${1}.txt | grep "actionType 2" > Type2recording.txt
rm Type3music.txt
cat eventType${1}.txt | grep "actionType 3" > Type3music.txt
cd ${current}

