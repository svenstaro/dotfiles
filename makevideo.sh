#!/bin/bash
#
# usage: makevideo.sh <input file> ..
#

inputfiles="$@"
newfiles=
joblist=($(jobs -p))

#num_jobs=$(cat /proc/cpuinfo | grep processor | wc -l)
num_jobs=10

[[ ! -d tmp ]] && mkdir tmp
for file in $inputfiles; do
	joblist=($(jobs -p))

	while (( ${#joblist[*]} > $num_jobs )); do
		joblist=($(jobs -p))
		sleep 0.1
	done

	newfile="${file//.*/.jpg}"
	echo "[Job ${#joblist[*]}] Converting $file ..."
	#convert -quality 100 "$file" tmp/"$newfile" &
	newfiles+="$newfile "
done

cat $(echo $newfiles) | ffmpeg -r 30 -f image2pipe -vcodec mjpeg -s 1280x800 -i - test.avi
