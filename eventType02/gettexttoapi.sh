#!/bin/sh
current=$(pwd)
cd ./eventTyp02
for item in $(cut -d ' ' -f 12 Type1text.txt)
do
  sed -i -e '2s/\("\)\(..*\)\("\)/\1'$item'\3/g' index.php
  echo "downloading the $item into the mp3"
  head -n2 index.php
  php -f index.php  | tail -n1 | xargs wget -O ./event/wav/$(grep ${item} Type1text.txt|cut -d " " -f 1 ).wav
  echo "success!"
done
cd $current

