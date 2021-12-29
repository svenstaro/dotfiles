#!/usr/bin/env bash
echo -n "0000:44:00.3" > /sys/bus/pci/drivers/xhci_hcd/unbind
echo -n "0000:44:00.3" > /sys/bus/pci/drivers/xhci_hcd/bind
