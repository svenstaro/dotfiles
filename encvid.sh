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

ffmpeg -i "${1}" -an -pass 1 -vcodec libx264 -vpre slow_firstpass -b "${bitrate}" -bt "${bitrate}" -threads 0 "${output}"
ffmpeg -i "${1}" -pass 2 -acodec libvorbis -aq 7 -vcodec libx264 -vpre slow -b "${bitrate}" -bt "${bitrate}" -threads 0 "${output}"
