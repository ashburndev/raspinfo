#!/bin/bash

date

uptime

hostname

hostname -I

uname -a

cat /proc/cpuinfo | tail -3

lsb_release -a

lscpu

vcgencmd version

vcgencmd get_lcd_info

vcgencmd measure_temp

vcgencmd get_mem arm && vcgencmd get_mem gpu

java -version

javac -version

gcc --version

ruby -v

rvm --version

python -V

python2 -V

python3 -V

node -v

npm -v

git --version

iwconfig

ifconfig

netstat -rn

lsusb --version

lsusb

lsusb | sort

lsusb -t

free -o

free -o -h

df -k

df -h

sudo fdisk -l | tail -5

sudo blkid

lsblk

sudo parted -l

mount

sudo service --status-all

fbset

xrandr

tvservice -n

tvservice -s

tvservice -a

tvservice -m CEA && tvservice -m DMT

tvservice -d edid.dat

xxd -g l edid.dat

edidparser edid.dat

cat /proc/sys/kernel/hostname

cat /proc/sys/kernel/ostype

cat /proc/sys/kernel/osrelease

cat /proc/sys/kernel/pid_max

cat /proc/sys/kernel/poweroff_cmd

cat /proc/version

cat /proc/meminfo

cat /proc/cpuinfo

cat /proc/cmdline

cat /proc/partitions

ls -latr /

ls -latr /boot

ls -latr /etc/ssh

ls -latr ~


