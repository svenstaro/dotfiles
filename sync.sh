#!/bin/bash

# Use first file in directory as starting point.
# This first file needs to exist in all dirs and has to be the first file
# in the reference list. Make sure to create that file manually if it doesn't
# exist.

dir_array=( $(ls *.png) )
dir_pos=0
list_array=( $(cat $1) )
list_pos=0

check_next() {
	#read

	if [[ ${dir_array[$dir_pos]} == ${list_array[$list_pos]} ]]; then
		echo "${dir_array[$dir_pos]} and ${list_array[$list_pos]} sync up, increasing position."
		dir_pos=$(( dir_pos + 1 ))
		list_pos=$(( list_pos + 1 ))
	else
		echo "Syncing ${list_array[$list_pos]} and updating dir_array"
		cp -v ${dir_array[$dir_pos-1]} ${list_array[$list_pos]}
		dir_array=( $(ls *.png) )
		#dir_pos=$(( dir_pos - 1 ))
	fi
}

while [[ ${list_array[${#list_array[@]}-1]} != ${dir_array[$dir_pos]} ]]; do
    check_next
done

echo "Done syncing"
