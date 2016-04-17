#!/bin/sh
#weitinglin
###################################################################################################
#Name: DailySetAction.sh
#Function:pending the file list in Dailywav/ and make a action code with file path output into DailytempSoundlist
#         generate the play shell scripts into SetPlay/ 
##################################################################################################
#n=$(ls -l Dailywav/*.wav |sed 's/  */ /g' |cut -d ' ' -f 9 | wc -l)
#k=$(echo ${n})


#rm tempSoundlist-e.txt
current=$(pwd)
cd ./eventType02
for item in $( ls -l ./event/wav | sed 's/  */ /g'|cut -d " " -f 9|sed 's/.wav//g'| sed '1d')
do
 echo omxplayer event/wav/${item}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> ./event/${item}.sh
 echo omxplayer ./wav/${item}.wav >> ./event/${item}.sh
done
#sed '1d' DailytempSoundlist.txt > tDailytempSoundlist.txt
#rm DailytempSoundlist.txt
#mv tDailytempSoundlist.txt DailytempSoundlist.txt 
#for a in $(seq "$k")
#do
#  touch ${dir}/SetPlay/DailySetPlay${a}.sh
#  echo \#\!\/bin\/sh >> ${dir}/SetPlay/DailySetPlay${a}.sh
#  cat ${dir}/DailytempSoundlist.txt| head -n ${a}| tail -n 1 >> ${dir}/SetPlay/DailySetPlay${a}.sh
#  cat ${dir}/DailytempSoundlist.txt| head -n ${a}| tail -n 1 >> ${dir}/SetPlay/DailySetPlay${a}.sh 
#  sed -i -e  '3s/omxplayer/rm/g' ${dir}/SetPlay/DailySetPlay${a}.sh
#done
cd ${current}
