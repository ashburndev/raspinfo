#!/bin/bash

# ashburndave@dphnuc:~/Downloads/rasptemp$ ./write-raspbian-to-microsd.sh 
# Sat Sep 10 08:42:58 EDT 2016
# 958+1 records in
# 958+1 records out
# 4019191808 bytes (4.0 GB) copied, 500.593 s, 8.0 MB/s
# Sat Sep 10 08:51:19 EDT 2016
# ashburndave@dphnuc:~/Downloads/rasptemp$ 

umount /dev/sdd1
date
sudo dd bs=4M if=./2016-05-27-raspbian-jessie.img of=/dev/sdd
date
sync
sudo eject /dev/sdd
echo complete

