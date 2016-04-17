#!/bin/sh
Signal=$(head -n1 signal.txt)
while [ -n $Signal ]
do
 A=$(php -f getMySQLrealTimeTalk.php)
 B=$(php -f getMySQLrealTimeMusic.php)
# C=$(php -f getMySQLrealTimeMotion.php)
####################realtime text to speech################
 if [ -z $A ]
  then
  echo "no text" 
  else
   #get text to api.sh

    for item in $( echo ${A} | cut -d ' ' -f 5 )
    do
      sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
      echo "downloading the $item into the mp3"
      head -n2 index.php
      sh getwav.sh
      echo "success!"
     done
  
   ##Change Sound
    for item in $(ls wav|sed 's/.wav//g')
    do
     python changePitch.py wav/${item}.wav wav/test.wav
     rm wav/${item}.wav
     mv wav/test.wav wav/${item}.wav
    done
  
    ##Setaction.sh


    for item in $(ls wav|sed 's/.wav//g')
    do
      touch ${item}.sh
      echo \#\!\/bin\/sh >> ${item}.sh 
      echo omxplayer wav/${item}.wav
      echo omxplayer wav/${item}.wav >> ${item}.sh
      sh ${item}.sh
      rm ${item}.sh
    done



   
   echo "finish!"
  ##remove the download sound file
   rm wav/*.wav 
  fi

  ###################################realtime music######################
  if [ -z  $B]
  then 
  echo "no music"
  else
    for item in $( echo $B |cut -d " " -f 5)
    do
    echo ${item}
    touch ${item}.sh
    echo \#\!\/bin\/sh >> ${item}.sh
    echo omxplayer Music/music${item}.mp3  >> ${item}.sh
    sh ${item}.sh
    rm ${item}.sh
    done
  fi
  
  ###################################realtime motion######################
  # if [ -z  $C]
  #then 
  #echo "no motion"
  #else
  #  for item in $( echo $B |cut -d " " -f 5)
  #  do
  #  python ${item}.py
  #  done
  #fi


done

