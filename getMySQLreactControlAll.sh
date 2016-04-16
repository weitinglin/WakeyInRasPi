#!/bin/sh
#sh getMySQLreact.sh

#EventType1
rm eventType01/eventType01.txt
sh getMySQLreactControl.sh | grep "eventType 1" | sort > eventType01/eventType01.txt



#EventType2
rm eventType02/eventType02.txt
sh getMySQLreactControl.sh | grep "eventType 2" | sort  > eventType02/eventType02.txt



#EventType3
rm eventType03/eventType03.txt
sh getMySQLreactControl.sh | grep "eventType 3" | sort > eventType03/eventType03.txt



#EventType4
rm eventType04/eventType04.txt
sh getMySQLreactControl.sh | grep "eventType 4" | sort > eventType04/eventType04.txt




#EventType5
rm eventType05/eventType05.txt
sh getMySQLreactControl.sh | grep "eventType 5" | sort > eventType05/eventType05.txt




#EventType6
rm eventType06/eventType06.txt
sh getMySQLreactControl.sh | grep "eventType 6" | sort > eventType06/eventType06.txt



