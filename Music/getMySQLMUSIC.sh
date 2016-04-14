#!/bin/sh
rm *.mp3 
php -f getMySQLMUSIC.php |sed 's/ID[0-9][0-9]*//g'| sed 's/Url//g' | xargs wget
