#!/bin/sh
#weitinglin
###################################################################################3
#Name: DailySetTIme.sh
#Function:  throw the shell file with at command according to the DailytempACtionDate.txt
##################################################################################
n=$(wc -l Dailytext.txt|cut -d ' ' -f 1)
cut -d " " -f 11-12 Dailytext.txt|sed  's/\([0-9][0-9]*\)\( \)\([0-9][0-9]*\)/\1\3 /g'|sed 's/^..//' > DailytempActionDate.txt

for a in $(seq "$n")
do 
echo  $(head -n  $a DailytempActionDate.txt| tail -n 1) | xargs at -f SetPlay/DailySetPlay${a}.sh -t 
done

#reference for the at command
#date +"%Y %m %d %H %M"
#at -f SetAction.sh  -t  1604040807

