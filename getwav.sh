#!/bin/sh
PHP_FILE=/home/pi/test/version1/Wakey_shell/index.php
OUTPUT_FILE=/home/pi/test/version1/Wakey_shell/wav/

#The Code
php -f ${PHP_FILE} | tail -n1 | xargs wget -P ${OUTPUT_FILE}
