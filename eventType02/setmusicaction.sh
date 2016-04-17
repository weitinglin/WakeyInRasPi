#!/bin/sh
#weitinglin
###################################################################################################
#Name: DailySetAction.sh
#Function:pending the file list in Dailywav/ and make a action code with file path output into DailytempSoundlist
#         generate the play shell scripts into SetPlay/ 
##################################################################################################
#dir="/home/pi/test/version1/Wakey_shell"
#n=$( wc -l Dailymusic.txt | cut -d " " -f 1)
#k=$(echo ${n})
#echo "" >  ${dir}/DailytempMusic.txt
#rm tempSoundlist-e.txt
current=$(pwd)

cd ./eventType02
for item in $(cut -d " " -f 1 Type3music.txt)
do
 temp=$( grep ${item} Type3music.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer ./Music/music${temp}.mp3  >> event/${item}.sh
 
done

cd ${current}

#sed '1d' DailytempMusic.txt > tDailytempMusic.txt
#rm DailytempMusic.txt
#mv tDailytempMusic.txt DailytempMusic.txt
#for a in $(seq "$k")
#do
#  touch ${dir}/SetMusic/DailySetPlay${a}.sh
#  echo \#\!\/bin\/sh >> ${dir}/SetMusic/DailySetPlay${a}.sh
#  cat ${dir}/DailytempMusic.txt| head -n ${a}| tail -n 1 >> ${dir}/SetMusic/DailySetPlay${a}.sh
#   if [ $a = $k ]
#   then 
#   echo rm ${dir}/SetMusic/*.sh >> ${dir}/SetMusic/DailySetPlay${a}.sh
#   fi  
#done

