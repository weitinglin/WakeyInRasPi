#!/bin/sh
#file save date
#DateDownload=$(ls -l wav/ | cut -d ' ' -f 13 | tail -n1)
#Hour=$(echo ${DateDownload}| cut -d ":" -f 1)
#Min=$(echo ${DateDownload}| cut -d ":" -f 2)
#HourPlus=0
#MinPlus=2
#echo ${Hour}+${HourPlus} |bc
#echo ${Min}+${MinPlus} |bc
#file name
dir="/home/pi/test/version1/Wakey_shell"
n=$(ls -l Dailywav/*.wav |sed 's/  */ /g' |cut -d ' ' -f 9 | wc -l)
k=$(echo ${n})

echo "" > DailytempSoundlist.txt
#rm tempSoundlist-e.txt
for item in $(ls -hl Dailywav/*.wav  |sed 's/  */ /g'|cut -d " " -f 9|cut -d '/' -f 2)
do
 echo omxplayer ${dir}/Dailywav/${item}
 echo omxplayer ${dir}/Dailywav/${item} >> ${dir}/DailytempSoundlist.txt
done
sed '1d' DailytempSoundlist.txt > tDailytempSoundlist.txt
rm DailytempSoundlist.txt
mv tDailytempSoundlist.txt DailytempSoundlist.txt 
for a in $(seq "$k")
do
  touch ${dir}/SetPlay/DailySetPlay${a}.sh
  echo \#\!\/bin\/sh >> ${dir}/SetPlay/DailySetPlay${a}.sh
  cat ${dir}/DailytempSoundlist.txt| head -n ${a}| tail -n 1 >> ${dir}/SetPlay/DailySetPlay${a}.sh
done

