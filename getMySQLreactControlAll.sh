#!/bin/sh
sh deletsh.sh
current=$(pwd)
sleep 1m
rm eventType.txt
sh getMySQLreactControl.sh |sort > eventType.txt

#EventType1
rm eventType01/eventType01.txt
cat eventType.txt | grep "eventType 1" | sort > eventType01/eventType01.txt

#Seperate.sh

cd ./eventType01
rm Type1text.txt
cat eventType01.txt | grep "actionType 1" > Type1text.txt
rm Type2recording.txt
cat eventType01.txt | grep "actionType 2" > Type2recording.txt
rm Type3music.txt
cat eventType01.txt | grep "actionType 3" > Type3music.txt
rm Type4motion.txt
cat eventType01.txt | grep "actionType 4" > Type4motion.txt


 #gettexttoapi.sh

for item in $(cut -d ' ' -f 12 Type1text.txt)
do
  sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
  echo "downloading the $item into the mp3"
  head -n2 index.php
  php -f index.php  | tail -n1 | xargs wget -O ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  python ../changePitch.py ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav ./event/wav/test.wav
  rm ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  mv ./event/wav/test.wav ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  echo "success!"
done
 #setaction.sh
for item in $( ls -l ./event/wav | sed 's/  */ /g'|cut -d " " -f 9|sed 's/.wav//g'| sed '1d')
do
 echo omxplayer event/wav/${item}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> ./event/${item}.sh
 echo omxplayer -o local ./event/wav/${item}.wav >> ./event/${item}.sh
done

 #getmusicaction.sh

for item in $(cut -d " " -f 1 Type3music.txt)
do
 temp=$( grep ${item} Type3music.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ../Music/music${temp}.mp3  >> event/${item}.sh
done

 # getrecording.sh

for item in  $(cut -d " " -f 1 Type2recording.txt )
do
 url=$( grep ${item} Type2recording.txt | cut -d " " -f 12)
 wget -O event/recording/${item}.wav $url
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local event/recording/${item}.wav  >> event/${item}.sh
done

 # getmotion
for item in $(cut -d " " -f 1 Type4motion.txt)
do
 temp=$( grep ${item} Type4motion.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo sudo python /home/pi/Wakey/LEDMode.py ${temp}  >> event/${item}.sh
done


 # settime
  touch event/settime.sh
  echo \#\!\/bin\/sh >> event/settime.sh
for item in $(cut -d " " -f 1 eventType01.txt )
do
 echo pwd >> event/settime.sh
 echo sh event/${item}.sh >> event/settime.sh
 echo rm event/${item}.sh >> event/settime.sh
done
echo $(cut -d " " -f 14-15 eventType01.txt|sed  's/\([0-9][0-9]*\)\( \)\([0-9][0-9]*\)/\1\3 /g'|sed 's/^..//g'|head -n 1) | xargs  at -f event/settime.sh -t

 #back 
cd ${current}




######################################################################################
###EventType2

rm eventType02/eventType02.txt
cat eventType.txt | grep "eventType 2" | sort  > eventType02/eventType02.txt

 #Seperate.sh

cd ./eventType02
rm Type1text.txt
cat eventType02.txt | grep "actionType 1" > Type1text.txt
rm Type2recording.txt
cat eventType02.txt | grep "actionType 2" > Type2recording.txt
rm Type3music.txt
cat eventType02.txt | grep "actionType 3" > Type3music.txt
rm Type4motion.txt
cat eventType02.txt | grep "actionType 4" > Type4motion.txt



 #gettexttoapi.sh

for item in $(cut -d ' ' -f 12 Type1text.txt)
do
  sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
  echo "downloading the $item into the mp3"
  head -n2 index.php
  php -f index.php  | tail -n1 | xargs wget -O ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  python ../changePitch.py ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav ./event/wav/test.wav
  rm ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  mv ./event/wav/test.wav ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  echo "success!"
done
 #setaction.sh
for item in $( ls -l ./event/wav | sed 's/  */ /g'|cut -d " " -f 9|sed 's/.wav//g'| sed '1d')
do
 echo omxplayer event/wav/${item}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> ./event/${item}.sh
 echo omxplayer -o local eventType02/event/wav/${item}.wav >> ./event/${item}.sh
done

 #getmusicaction.sh

for item in $(cut -d " " -f 1 Type3music.txt)
do
 temp=$( grep ${item} Type3music.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./Music/music${temp}.mp3  >> event/${item}.sh
done

 # getmotion
for item in $(cut -d " " -f 1 Type4motion.txt)
do
 temp=$( grep ${item} Type4motion.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo sudo python /home/pi/Wakey/LEDMode.py ${temp}  >> event/${item}.sh
done



 # getrecording.sh

for item in  $(cut -d " " -f 1 Type2recording.txt )
do
 url=$( grep ${item} Type2recording.txt | cut -d " " -f 12)
 wget -O event/recording/${item}.wav $url
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./eventType02/event/recording/${item}.wav  >> event/${item}.sh
done
cd ${current}



#################################################################################################
#EventType3
rm eventType03/eventType03.txt
cat eventType.txt | grep "eventType 3" | sort > eventType03/eventType03.txt

#Seperate.sh

cd ./eventType03

rm Type1text.txt
cat eventType03.txt | grep "actionType 1" > Type1text.txt
rm Type2recording.txt
cat eventType03.txt | grep "actionType 2" > Type2recording.txt
rm Type3music.txt
cat eventType03.txt | grep "actionType 3" > Type3music.txt
rm Type4motion.txt
cat eventType03.txt | grep "actionType 4" > Type4motion.txt


 #gettexttoapi.sh

for item in $(cut -d ' ' -f 12 Type1text.txt)
do
  sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
  echo "downloading the $item into the mp3"
  head -n2 index.php
  php -f index.php  | tail -n1 | xargs wget -O ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  python ../changePitch.py ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav ./event/wav/test.wav
  rm ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  mv ./event/wav/test.wav ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  echo "success!"
done
 #setaction.sh

for item in $( ls -l ./event/wav | sed 's/  */ /g'|cut -d " " -f 9|sed 's/.wav//g'| sed '1d')
do
 echo omxplayer event/wav/${item}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> ./event/${item}.sh
 echo omxplayer -o local eventType03/event/wav/${item}.wav >> ./event/${item}.sh
done


 #getmusicaction.sh

for item in $(cut -d " " -f 1 Type3music.txt)
do
 temp=$( grep ${item} Type3music.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./Music/music${temp}.mp3  >> event/${item}.sh
done

 # getrecording.sh

for item in  $(cut -d " " -f 1 Type2recording.txt )
do
 url=$( grep ${item} Type2recording.txt | cut -d " " -f 12)
 wget -O event/recording/${item}.wav $url
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./eventType03/event/recording/${item}.wav  >> event/${item}.sh
done

 # getmotion
for item in $(cut -d " " -f 1 Type4motion.txt)
do
 temp=$( grep ${item} Type4motion.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo sudo python /home/pi/Wakey/LEDMode.py ${temp}  >> event/${item}.sh
done



cd ${current}


#######################################################################################################
#EventType4
rm eventType04/eventType04.txt
cat eventType.txt | grep "eventType 4" | sort > eventType04/eventType04.txt

#Seperate.sh

cd ./eventType04
rm Type1text.txt
cat eventType04.txt | grep "actionType 1" > Type1text.txt
rm Type2recording.txt
cat eventType04.txt | grep "actionType 2" > Type2recording.txt
rm Type3music.txt
cat eventType04.txt | grep "actionType 3" > Type3music.txt
rm Type4motion.txt
cat eventType04.txt | grep "actionType 4" > Type4motion.txt

 #gettexttoapi.sh

for item in $(cut -d ' ' -f 12 Type1text.txt)
do
  sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
  echo "downloading the $item into the mp3"
  head -n2 index.php
  php -f index.php  | tail -n1 | xargs wget -O ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  python ../changePitch.py ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav ./event/wav/test.wav
  rm ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  mv ./event/wav/test.wav ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  echo "success!"
done
 #setaction.sh
 
for item in $( ls -l ./event/wav | sed 's/  */ /g'|cut -d " " -f 9|sed 's/.wav//g'| sed '1d')
do
 echo omxplayer event/wav/${item}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> ./event/${item}.sh
 echo omxplayer -o local eventType04/event/wav/${item}.wav >> ./event/${item}.sh
done

 #getmusicaction.sh

for item in $(cut -d " " -f 1 Type3music.txt)
do
 temp=$( grep ${item} Type3music.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./Music/music${temp}.mp3  >> event/${item}.sh
done

 # getrecording.sh

for item in  $(cut -d " " -f 1 Type2recording.txt )
do
 url=$( grep ${item} Type2recording.txt | cut -d " " -f 12)
 wget -O event/recording/${item}.wav $url
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./eventType04/event/recording/${item}.wav  >> event/${item}.sh
done

 # getmotion
for item in $(cut -d " " -f 1 Type4motion.txt)
do
 temp=$( grep ${item} Type4motion.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo sudo python /home/pi/Wakey/LEDMode.py ${temp}  >> event/${item}.sh
done




cd ${current}


################################################################################################
#EventType5
rm eventType05/eventType05.txt
cat eventType.txt | grep "eventType 5" | sort > eventType05/eventType05.txt

#Seperate.sh

cd ./eventType05
rm Type1text.txt
cat eventType05.txt | grep "actionType 1" > Type1text.txt
rm Type2recording.txt
cat eventType05.txt | grep "actionType 2" > Type2recording.txt
rm Type3music.txt
cat eventType05.txt | grep "actionType 3" > Type3music.txt
rm Type4motion.txt
cat eventType05.txt | grep "actionType 4" > Type4motion.txt


 #gettexttoapi.sh

for item in $(cut -d ' ' -f 12 Type1text.txt)
do
  sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
  echo "downloading the $item into the mp3"
  head -n2 index.php
  php -f index.php  | tail -n1 | xargs wget -O ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  python ../changePitch.py ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav ./event/wav/test.wav
  rm ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  mv ./event/wav/test.wav ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  echo "success!"
done
 #setaction.sh
for item in $( ls -l ./event/wav | sed 's/  */ /g'|cut -d " " -f 9|sed 's/.wav//g'| sed '1d')
do
 echo omxplayer event/wav/${item}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> ./event/${item}.sh
 echo omxplayer -o local eventType05/event/wav/${item}.wav >> ./event/${item}.sh
done

 #getmusicaction.sh

for item in $(cut -d " " -f 1 Type3music.txt)
do
 temp=$( grep ${item} Type3music.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./Music/music${temp}.mp3  >> event/${item}.sh
done

 # getrecording.sh

for item in  $(cut -d " " -f 1 Type2recording.txt )
do
 url=$( grep ${item} Type2recording.txt | cut -d " " -f 12)
 wget -O event/recording/${item}.wav $url
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./eventType05/event/recording/${item}.wav  >> event/${item}.sh
done

 # getmotion
for item in $(cut -d " " -f 1 Type4motion.txt)
do
 temp=$( grep ${item} Type4motion.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo sudo python /home/pi/Wakey/LEDMode.py ${temp}  >> event/${item}.sh
done



cd ${current}



###########################################################################################
#EventType6
rm eventType06/eventType06.txt
cat eventType.txt | grep "eventType 6" | sort > eventType06/eventType06.txt

#Seperate.sh

cd ./eventType06
rm Type1text.txt
cat eventType06.txt | grep "actionType 1" > Type1text.txt
rm Type2recording.txt
cat eventType06.txt | grep "actionType 2" > Type2recording.txt
rm Type3music.txt
cat eventType06.txt | grep "actionType 3" > Type3music.txt
rm Type4motion.txt
cat eventType06.txt | grep "actionType 4" > Type4motion.txt

 #gettexttoapi.sh

for item in $(cut -d ' ' -f 12 Type1text.txt)
do
  sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
  echo "downloading the $item into the mp3"
  head -n2 index.php
  php -f index.php  | tail -n1 | xargs wget -O ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  python ../changePitch.py ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav ./event/wav/test.wav
  rm ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  mv ./event/wav/test.wav ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1).wav
  echo "success!"
done
 #setaction.sh

for item in $( ls -l ./event/wav | sed 's/  */ /g'|cut -d " " -f 9|sed 's/.wav//g'| sed '1d')
do
 echo omxplayer event/wav/${item}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> ./event/${item}.sh
 echo omxplayer -o local eventType06/event/wav/${item}.wav >> ./event/${item}.sh
done

 #getmusicaction.sh

for item in $(cut -d " " -f 1 Type3music.txt)
do
 temp=$( grep ${item} Type3music.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./Music/music${temp}.mp3  >> event/${item}.sh
done

 # getrecording.sh

for item in  $(cut -d " " -f 1 Type2recording.txt )
do
 url=$( grep ${item} Type2recording.txt | cut -d " " -f 12)
 wget -O event/recording/${item}.wav $url
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo omxplayer -o local ./eventType06/event/recording/${item}.wav  >> event/${item}.sh
done

 # getmotion
for item in $(cut -d " " -f 1 Type4motion.txt)
do
 temp=$( grep ${item} Type4motion.txt | cut -d " " -f 12 )
 echo ${temp}
 touch event/${item}.sh
 echo \#\!\/bin\/sh >> event/${item}.sh
 echo sudo python /home/pi/Wakey/LEDMode.py ${temp}  >> event/${item}.sh
done



cd ${current}


