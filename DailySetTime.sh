#!/bin/sh
YearDay=$(cut -d ' ' -f 11 Dailytext.txt| paste -d" " -s)
HourMin=$(cut -d ' ' -f 12 Dailytext.txt| paste -d" " -s)
FileList=$(ls -hl SetPlay|sed '1d' |sed 's/  */ /g'|cut -d ' ' -f 9)
n=$(wc -l Dailytext.txt|cut -d ' ' -f 1)
cut -d " " -f 11-12 Dailytext.txt|sed  's/\([0-9][0-9]*\)\( \)\([0-9][0-9]*\)/\1\3 /g'|sed 's/^..//' > DailytempActionDate.txt

for  a in $(seq "$n")
do 
echo  $(head -n  $a DailytempActionDate.txt| tail -n 1) | xargs at -f SetPlay/DailySetPlay${a}.sh -t 
done

#echo ${#YearDay[@]}
#echo $HourMin[1]
#echo $FileList[2]
#date +"%Y %m %d %H %M"
#at -f SetAction.sh  -t  1604040807

