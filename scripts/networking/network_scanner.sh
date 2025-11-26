#!/bin/bash

# Network Scanner Script
# Author: admin
# Scans local network for active devices

echo "*** NETWORK SCANNER ***"
echo ""
echo ">>>: Date: $(date)"
echo ""

# Get current's machine IP and subnet

MY_IP=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | head -1)
SUBNET=$(echo $MY_IP | cut -d. -f1-3)

echo ">>>: Your IP: $MY_IP"
echo ""
echo ">>> Scanning subnet: ${SUBNET}.0/24 <<<"
echo ">>> Scanning for active devices... <<<"
echo ">>> This may take a moment... <<<"
echo ""


# Check if nmap is installed, if it is do nmap scan


if command -v nmap &> /dev/null; then
	echo ">>> NMAP SCAN <<<"
	echo ""
	nmap -sn ${SUBNET}.0/24
fi


# Show ARP Table, discard incomplete entries (devices without MAC addresses)

echo ""
echo ">>> ARP TABLE (KNOWN DEVICES) <<<"
echo ""
arp -a | grep -v incomplete

echo ""
echo "Scan complete!"


