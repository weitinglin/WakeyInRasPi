#!/bin/sh
for item in $(cut -d ' ' -f 12 Type1text.txt)
do
  sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
  echo "downloading the $item into the mp3"
  head -n2 index.php
  sh getwav.sh ${item}
  echo "success!"
done
