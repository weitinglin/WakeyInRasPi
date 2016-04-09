#!/bin/sh
   php -f getMySQLevent.php > DailyText.txt;
   sh DailygetTextToApi.sh;
   sh DailySetAction.sh;
   
