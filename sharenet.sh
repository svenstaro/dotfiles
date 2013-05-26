#!/bin/bash
INET_IFACE=eth0
SHARE_IFACE=wlan0
SHARE_NAME=lol_net
ifconfig ${SHARE_IFACE} down
iwconfig ${SHARE_IFACE} essid ${SHARE_NAME} mode Ad-Hoc
ifconfig ${SHARE_IFACE} up
ifconfig ${SHARE_IFACE} 192.168.5.1
echo 1 > /proc/sys/net/ipv4/ip_forward
sed s/^interface=.*$/interface=${SHARE_IFACE}/g -i /etc/dnsmasq.conf
systemctl restart dnsmasq
iptables -t nat -A POSTROUTING -o ${INET_IFACE} -j MASQUERADE
