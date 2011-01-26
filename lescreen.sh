#!/bin/bash
#
# Small script for making screenshots and uploading them.
#

archey3
sleep 0.2
echo "Le screenshotting and uploading..."
scrot -q 1 /tmp/scrot.png --exec 'imgurbash $f'
