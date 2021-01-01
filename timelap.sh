#!/bin/bash

# get arguments
while getopts :hi:r: option; do
  case "${option}" in
    h)
      echo "help: "
      echo "Select -h for this message."
      echo "Add -i to select the intervals (add 's' after for seconds, 'm' for minutes, and 'h' for hours."
      echo "Add -r to select the number of repetitions."
      exit
      ;;
    i)
      intervals=${OPTARG}
      echo "interval time: $intervals"
      ;;
    r)
      declare -i reps=${OPTARG}
      echo "number of reps: $reps"
      ;;
    ?)
      echo "No -${OPTARG} option found."
      ;;
  esac
done

# set webcam file
webcam="/dev/video0"

# go to timelap folder
directory="/home/pi/usb_link/timelap"
if [ $(pwd) = $directory ]; then
	echo "You are in the right directory"
else
	echo "You are not in the right directory"
	cd $directory
fi

# make new directory
mkdir `date +%d-%H-%M`
cd `date +%d-%H-%M`

# take pics
num=1

while [ $num -le $reps ]; do
	name=`printf "%09d" $num`
	echo "taking picture number $num"
	fswebcam -d $webcam "pic$name.jpg" 2>/dev/null
	echo "picture taken" 
	sleep $intervals
	num=$(($num+1))
done
