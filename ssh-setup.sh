#!/bin/bash

pkg install openssh -y
sshdpkg install iproute2 -y
sshd
clear
echo ""
echo "Please create ssh Password"
echo "--------------------------"
passwd

USER=$(whoami) 
IP=$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v 127.0.0.1)
echo ""
echo "COMMAND:"
echo ""
echo "     ssh -p 8022 $USER@$IP"
echo ""
echo ""
