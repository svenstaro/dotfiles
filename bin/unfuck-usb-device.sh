#!/usr/bin/env bash
echo "$1" > /sys/bus/usb/drivers/usb/unbind
echo "$1" > /sys/bus/usb/drivers/usb/bind
