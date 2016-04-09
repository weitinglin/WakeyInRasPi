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
n=$(ls -l wav/*.wav | cut -d ' ' -f 14|cut -d '/' -f 2 | wc -l | cut -d ' ' -f 8)
k=$(echo ${n}+1|bc)

#rm tempSoundlist-e.txt
for item in $(ls -hl wav/*.wav  |sed 's/  */ /g'|cut -d " " -f 9|cut -d '/' -f 2)
do
 echo omxplayer ${dir}/wav/${item}
 echo omxplayer ${dir}/wav/${iStem} >> ${dir}/tempSoundlist.txt
done

for a in $(seq "$k")
do
  touch ${dir}/SetPlay${a}.sh
  echo \#\!\/bin\/sh >> ${dir}/SetPlay${a}.sh
  cat ${dir}/tempSoundlist.txt| head -n ${a}| tail -n 1 >> ${dir}/SetPlay${a}.sh
  sh ${dir}/SetPlay${a}.sh
  rm ${dir}/SetPlay${a}.sh
done
#at -f SetPlay.sh
#save the last time playlist
#cp tempSoundlist.txt tempSoundlist-e.txt
#remove the playlist
#echo "" > tempSoundlist.txt
#remove the wav after playing
#rm wav/*.wav
