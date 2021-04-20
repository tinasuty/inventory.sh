#!/bin/bash

Author :Tina R

#Full inventory 
# OS running and version, size of memory
#size of harddrive, cpu speed, kernel version
#system bit (32 or 64), the hostname, ip address,
#all opened ports,dns, manufacturer,mac address
# is the system virtual or physical

echo -n "Name"
uname -r
echo -n "IP:"
hostname -I | awk '{print $1}'
echo -n "CPUs: "
cat /proc/cpuinfo | grep processor | wc -l
echo -n "CPU Speed (MHz): "[root@localhost student]
 grep MHz /proc/cpuinfo | sort | awk '{ print $NF}' | uniq -c
echo -n "OS: "
uname -o -r
if [ -f /etc/*release ]; then
echo -n "  "
cat /etc/*release
fi

echo -n "Memory: "
grep MemTotal /proc/meminfo | awk '{print $2,$3}'
echo -n "Disk(s): "
fdisk -l | grep Disk 
echo -n "System bit: "
uname -m
echo -n "hostname: "
echo -n "open ports: "
lsof -i | grep LISTEN
echo -n "dns: "
hostnamedig google.com ANY
echo -n "Manufacturer: "
dmidecode -t system
echo -n "mac address: "
cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address

