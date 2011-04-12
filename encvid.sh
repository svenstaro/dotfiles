#!/bin/bash
#
# Script to convert movie file to high-quality x264 using ffmpeg.
# Usage: encvid.sh <input> <bitrate>
#

output="${1//.*/.mkv}"
bitrate=5000k
if [[ ${2} != "" ]]; then
	bitrate=${2}
fi

echo -e "\033[1;31mFirst pass\033[0m"
ffmpeg -i "${1}" -an -sn -pass 1 -vcodec libx264 -vpre slow_firstpass -b "${bitrate}" -bt "${bitrate}" -threads 0 "${output}"

echo ""
echo -e "\033[1;31mSecond pass\033[0m"
ffmpeg -i "${1}" -sn -pass 2 -acodec libvorbis -aq 7 -vcodec libx264 -vpre slow -b "${bitrate}" -bt "${bitrate}" -threads 0 "${output}"
