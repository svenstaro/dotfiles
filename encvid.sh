#!/bin/bash
output="${1//.*/.mkv}"
ffmpeg -i "${1}" -an -pass 1 -vcodec libx264 -vpre slow_firstpass -b "${2}" -bt "${2}" -threads 0 "${output}"
ffmpeg -i "${1}" -pass 2 -acodec libvorbis -aq 7 -vcodec libx264 -vpre slow -b "${2}" -bt "${2}" -threads 0 "${output}"
