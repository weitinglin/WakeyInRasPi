#!/bin/sh
for item in $(cut -d ' ' -f 9 Dailytext.txt)
do
  sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
  echo "downloading the $item into the mp3"
  head -n2 index.php
  sh Dailygetwav.sh
  echo "success!"
done
