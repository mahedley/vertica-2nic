#!/bin/bash
# An set of disks to ignore from partitioning and formatting


DISKS=`ls -1 /dev/sd*|egrep -v "[0-9]$"|egrep -v /dev/sda|grep -v /dev/sdb`
COUNT=`ls -1 /dev/sd*|egrep -v "[0-9]$"|egrep -v /dev/sda|grep -v /dev/sdb|wc -l`
mdadm --create /dev/md10 --level 0 --raid-devices=$COUNT $DISKS
echo 

mkfs.ext4 /dev/md10

mkdir /data
UUID=$(ls -l /dev/disk/by-uuid|grep md10|awk '{print $9}')
echo UUID=$UUID	/dev/md10	ext4	defaults	,	errors=remount-ro	0		1>>/etc/fstab
mount /dev/md10 /data

install -o root -g root -m 0600 /dev/null /swapfile
dd if=/dev/zero of=/swapfile bs=1024 count=2048k
mkswap /swapfile
swapon /swapfile
echo "/swapfile swap swap auto 0 0" >> /etc/fstab
