#!/bin/sh
#weitinglin
###################################################################################################
#Name: DailySetAction.sh
#Function:pending the file list in Dailywav/ and make a action code with file path output into DailytempSoundlist
#         generate the play shell scripts into SetPlay/ 
##################################################################################################
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
  cat ${dir}/DailytempSoundlist.txt| head -n ${a}| tail -n 1 >> ${dir}/SetPlay/DailySetPlay${a}.sh 
  sed -i -e  '3s/omxplayer/rm/g' ${dir}/SetPlay/DailySetPlay${a}.sh
done

