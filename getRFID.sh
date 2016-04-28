#!/bin/sh
RFID=$(head -n 1 ../../../Wakey/rtTagIDTxt.txt  | sed 's/\(\[\|\]\)//g' | sed 's/,//g' |sed 's/  *//g' ) 
#tag1=2424622786105
#tag2=821722278675
#tag3=242212298684
#tag4=194462278689
#tag5=501612278638
##event tag
tag1=17813722686143
tag2=187423086232
tag3=1466822986101
tag4=210772308647
tag5=17813923086137
##
tag6=502062278673
tag7=16219229862
tag8=13014122686187
tag9=226152298694
tag10=194972288617
tag11=13020222686252
tag12=24292298672
tag13=16216822786191
tag14=181562308662
tag15=822523186250
tag16=503622886164
tag17=210702308636
tag18=210462278673
tag19=2261242278643
tag20=130822288698
tag21=1149722886161
tag22=146102298643
tag23=348223086192
tag24=982542268640
tag25=8214823086118
tag26=16216022786183
tag27=2424022886104
tag28=1467722986108
tag29=242152288679
tag30=21017222786203
tag31=2263422786117
tag32=1941072298626
tag33=1941222786123
echo $RFID

sudo python /home/pi/Wakey/LEDMode.py 1

if [ $RFID = $tag6 ]
then 
echo $tag6
omxplayer -o local  146107053625443.wav
fi

if [ $RFID = $tag7 ]
then
echo $tag7
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music22.mp3
fi

if [ $RFID = $tag8 ]
then
echo $tag8
sudo python /home/pi/Wakey/EarMove.py 1
fi

if [ $RFID = $tag1 ]
then
 for item in $(ls -l  eventType02/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi

if [ $RFID = $tag2 ]
then
 for item in $(ls -l  eventType03/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi

if [ $RFID = $tag3 ]
then
 for item in $(ls -l  eventType04/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi

if [ $RFID = $tag4 ]
then
 for item in $(ls -l  eventType05/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi

if [ $RFID = $tag5 ]
then
 for item in $(ls -l  eventType06/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi

if [ $RFID = $tag9 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music1.mp3
fi

if [ $RFID = $tag10 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music2.mp3
fi

if [ $RFID = $tag11 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music3.mp3
fi

if [ $RFID = $tag12 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music4.mp3
fi

if [ $RFID = $tag13 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music5.mp3
fi

if [ $RFID = $tag14 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music6.mp3
fi

if [ $RFID = $tag15 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music7.mp3
fi

if [ $RFID = $tag16 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music8.mp3
fi

if [ $RFID = $tag17 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music9.mp3
fi

if [ $RFID = $tag18 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music10.mp3
fi

if [ $RFID = $tag19 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music11.mp3
fi

if [ $RFID = $tag20 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music12.mp3
fi

if [ $RFID = $tag21 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music13.mp3
fi

if [ $RFID = $tag22 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music14.mp3
fi

if [ $RFID = $tag23 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music15.mp3
fi

if [ $RFID = $tag24 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music16.mp3
fi

if [ $RFID = $tag25 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music17.mp3
fi

if [ $RFID = $tag26 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music18.mp3
fi

if [ $RFID = $tag27 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music19.mp3
fi

if [ $RFID = $tag28 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music20.mp3
fi

if [ $RFID = $tag29 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music21.mp3
fi

if [ $RFID = $tag30 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music22.mp3
fi

if [ $RFID = $tag31 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music23.mp3
fi

if [ $RFID = $tag32 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music24.mp3
fi

if [ $RFID = $tag33 ]
then
omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music25.mp3
fi
