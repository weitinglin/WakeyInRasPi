#!/bin/sh
job=$( ps -C omxplayer |tail -n 1 | cut -d " " -f 2 )
job2=$( ps -C omxplayer.bin |tail -n 1 | cut -d " " -f 2 )
echo ${job}

kill -15 ${job}
kill -16 ${job2}
