#!/bin/bash

# set webcam file
webcam="/dev/video0"

# go to timelap folder
directory="/home/leo/timelap"
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
while [ $num -le 10 ]; do
	name=`printf "%09d" $num`
	ffmpeg -f video4linux2 -i $webcam -vframes 1 "pic$name.jpg" 
	sleep 15s
	num=$(($num+1))
done

:'
#!/bin/bash

# set webcam file
webcam="/dev/video0"

# go to timelap folder
directory="/mnt/USB0/timelap"
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
while [ $num -le 10 ]; do
	name=`printf "%09d" $num`
	fswebcam -d $webcam "pic$name.jpg" 
	sleep 1m
	num=$(($num+1))
done
'

