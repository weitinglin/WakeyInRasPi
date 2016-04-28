#!/bin/sh
for item in 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33
do
n=$(echo ${item} - 8 | bc)
echo if [ \$RFID = \$tag${item} ] >> getRFID.sh
echo then	             >> getRFID.sh
echo  omxplayer -o local /home/pi/test/version1/Wakey_shell/Music/music${n}.mp3 >> getRFID.sh
echo fi  >> getRFID.sh
echo add the tag${item}
echo music$n.mp3
done
