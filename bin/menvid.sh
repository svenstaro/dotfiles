#!/bin/bash
#
# Script to create x264 movie file from many input images in png format.
# Usage: encvid.sh <input> <bitrate>
#

output="${1//.*/.mkv}"
bitrate=5000
if [[ ${2} != "" ]]; then
	bitrate=${2}
fi
echo -e "Using bitrate of $bitrate \n"

mencoder mf://*.png -mf w=1366:h=768:fps=20:type=png -ovc x264 -x264encopts threads=auto:pass=1:bitrate=$bitrate:slow_firstpass -oac copy -o $output
mencoder mf://*.png -mf w=1366:h=768:fps=20:type=png -ovc x264 -x264encopts threads=auto:pass=2:bitrate=$bitrate -oac lavc -lavcopts acodec=vorbis -o "${output}"
#mencoder mf://*.png -mf w=1280:h=800:fps=15:type=png -ovc lavc -lavcopts vcodec=ffv1 -oac copy -o $output
#mencoder "${1}" -ovc x264 -x264encopts threads=auto:pass=1:bitrate=$bitrate:slow_firstpass -oac lavc -lavcopts acodec=vorbis -o "${output}"
#mencoder "${1}" -ovc x264 -x264encopts threads=auto:pass=2:bitrate=$bitrate -oac lavc -lavcopts acodec=vorbis -o "${output}"
