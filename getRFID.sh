#!/bin/sh
RFID=$(head -n 1 ../../../Wakey/rtTagIDTxt.txt  | sed 's/\(\[\|\]\)//g' | sed 's/,//g' |sed 's/  *//g' ) 
tag1=2424622786105
tag2=821722278675
tag3=242212298684
tag4=194462278689
tag5=501612278638
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
echo $Event02

if [ $RFID = $tag8 ]
then
 for item in $(ls -l  eventType02/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi

if [ $RFID = $tag6 ]
then
 for item in $(ls -l  eventType03/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi

if [ $RFID = $tag20 ]
then
 for item in $(ls -l  eventType04/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi

if [ $RFID = $tag27 ]
then
 for item in $(ls -l  eventType05/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi

if [ $RFID = $tag33 ]
then
 for item in $(ls -l  eventType06/event/*.sh | cut -d " " -f 9)
  do 
    sh ${item}
    rm ${item}
  done
fi



