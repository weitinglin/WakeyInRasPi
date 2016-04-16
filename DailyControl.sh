#!/bin/sh
php -f getMySQLevent.php > Dailytext.txt;
sh DailygetTextToApi.sh;
sh DailySetAction.sh;
sh DailySetTime.sh
