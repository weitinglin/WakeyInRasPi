#!/bin/sh
Siganl=$(head -n2 signal.txt | tail -n 1)
while [ -n $Signal ]
do
 head -n 1 ../../../Wakey/rtTagIDTxt.txt  | sed 's/\(\[\|\]\)//g' | sed 's/,//g' |sed 's/  *//g' >  ../../../Wakey/rtTagIDTxtnew.txt
 if  [ -n $(diff ../../../Wakey/rtTagIDTxtnew.txt ../../../Wakey/rtTagIDTxttemp.txt )]
 then
  echo  detect
 #else  [ ] 
  sh getRFID.sh
  head -n 1 ../../../Wakey/rtTagIDTxt.txt  | sed 's/\(\[\|\]\)//g' | sed 's/,//g' |sed 's/  *//g' >  ../../../Wakey/rtTagIDTxttemp.txt
 fi
done
