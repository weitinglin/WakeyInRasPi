#!/bin/sh
#weitinglin
###################################################################################################
#Name: DailySetAction.sh
#Function:pending the file list in Dailywav/ and make a action code with file path output into DailytempSoundlist
#         generate the play shell scripts into SetPlay/ 
##################################################################################################
dir="/home/pi/test/version1/Wakey_shell"
n=$( wc -l Dailymusic.txt | cut -d " " -f 1)
k=$(echo ${n})

#rm tempSoundlist-e.txt
for item in $(cut -d " " -f 9 Dailymusic.txt)
do
 echo omxplayer ${dir}/Music/music${item}.mp3
 echo omxplayer ${dir}/Music/music${item}.mp3 >> ${dir}/DailytempMusic.txt
done

for a in $(seq "$k")
do
  touch ${dir}/SetMusic/DailySetPlay${a}.sh
  echo \#\!\/bin\/sh >> ${dir}/SetMusic/DailySetPlay${a}.sh
  cat ${dir}/DailytempMusic.txt| head -n ${a}| tail -n 1 >> ${dir}/SetMusic/DailySetPlay${a}.sh
  
done

