#/bin/bash
#
# Small script for making screenshots and uploading them.
#

archey3
echo "Le screenshotting..."
scrot -q 1 /tmp/scrot.png
echo "Le uploading..."
imgurbash /tmp/scrot.png
