#!/bin/bash

# Port Scanner script
# Author: admin
# Scans for ports on specified host

echo "*** PORT SCANNER ***"
echo ""
echo ">>>: Date: $(date)"
echo ""


# Check if target IP was provided

if [ -z "$1" ]; then
	echo "Usage: $0 <target_ip>"
	echo "Example: $0 192.168.1.1"
	exit 1
fi


TARGET=$1


echo ">>>: Target: $TARGET"
echo ""



# Interactive menu

echo "Please choose scan type:"
echo ""
echo "1) Top 20 common ports"
echo "2) Custom port range"
read -p "Enter choice [1-2]: " choice

case $choice in
	1)
		PORTS="21,22,23,25,53,80,110,143,443,465,587,993,995,3306,3389,5432,5900,8080,8443,27017"
		echo "Scanning top 20 common ports..."
		;;
	2)
		read -p "Enter port range (eg., 1-1000: " PORTS
		echo "Scanning ports $PORTS..."
		;;
	*)
		echo "Invalid choice. Exiting..."
		exit 1
		;;
esac

echo ""



# Run nmap scan

nmap -p $PORTS $TARGET


echo ""
echo "Scan complete!"
