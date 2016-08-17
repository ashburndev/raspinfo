date

uptime

hostname

hostname -I

uname -a

cat /proc/cpuinfo | tail -3

vcgencmd version

vcgencmd get_lcd_info

vcgencmd measure_temp

vcgencmd get_mem arm && vcgencmd get_mem gpu

java -version

javac -version

git --version

ifconfig

lsusb

lsusb -t

free -o

free -o -h

df -k

df -h

sudo fdisk -l | tail -5

sudo blkid

lsblk

sudo parted -l

sudo service --status-all

tvservice -n

tvservice -s

tvservice -a

tvservice -m CEA && tvservice -m DMT

tvservice -d edid.dat

edidparser edid.dat

cat /proc/sys/kernel/hostname

cat /proc/sys/kernel/ostype

cat /proc/sys/kernel/osrelease

cat /proc/sys/kernel/pid_max

cat /proc/sys/kernel/poweroff_cmd

cat /proc/version

cat /proc/meminfo

cat /proc/cpuinfo

ls -latr ~

ls -latr /

ls -latr /boot


