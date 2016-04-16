#!/bin/sh
PHP_FILE=/home/pi/test/version1/Wakey_shell/index.php
OUTPUT_FILE=./event/wav/

#The Code
php -f index.php  | tail -n1 | xargs wget -O ./event/wav/$(grep $1 Type1text.txt|cut -d " " -f 1 ).wav 
