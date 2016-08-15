# raspinfo
a simple Grails web application to display information about my Raspberry Pi

## Creating the micro sd card to insert into the Raspberry Pi

Using my Linux computer (an Intel NUC), I ran these commands

    grep 'ashburndave@dphnuc' rasp.txt
    ls -latr
    cat 2016-05-27-raspbian-jessie.shasum
    shasum 2016-05-27-raspbian-jessie.zip
    shasum 2016-05-27-raspbian-jessie.zip | diff - 2016-05-27-raspbian-jessie.shasum1c1
    df -h
    df -h
    umount /dev/sdd1
    dd bs=4M status=progress if=~/2016-05-27-raspbian-jessie.img of=/dev/sdd
    dd bs=4M if=./2016-05-27-raspbian-jessie.img of=/dev/sdd
    sudo dd bs=4M if=./2016-05-27-raspbian-jessie.img of=/dev/sdd
    sync
    eject /dev/sdd
    eject /dev/sdd1
    sudo eject /dev/sdd

The commands above produced these results

    ashburndave@dphnuc:~/Downloads/rasptemp$ ls -latr
    total 5286248
    -rw-r--r-- 1 ashburndave ashburndave 4019191808 May 27 12:50 2016-05-27-raspbian-jessie.img
    -rw-rw-r-- 1 ashburndave ashburndave 1393896178 Aug 14 08:09 2016-05-27-raspbian-jessie.zip
    -rw-rw-r-- 1 ashburndave ashburndave         41 Aug 14 08:45 2016-05-27-raspbian-jessie.shasum
    drwxr-xr-x 5 ashburndave ashburndave      12288 Aug 14 08:50 ..
    drwxrwxr-x 2 ashburndave ashburndave       4096 Aug 14 08:57 .
    ashburndave@dphnuc:~/Downloads/rasptemp$ 
    ashburndave@dphnuc:~/Downloads/rasptemp$ cat 2016-05-27-raspbian-jessie.shasum
    64c7ed611929ea5178fbb69b5a5f29cc9cc7c157
    ashburndave@dphnuc:~/Downloads/rasptemp$ shasum 2016-05-27-raspbian-jessie.zip
    64c7ed611929ea5178fbb69b5a5f29cc9cc7c157  2016-05-27-raspbian-jessie.zip
    ashburndave@dphnuc:~/Downloads/rasptemp$ 
    ashburndave@dphnuc:~/Downloads/rasptemp$ shasum 2016-05-27-raspbian-jessie.zip | diff - 2016-05-27-raspbian-jessie.shasum1c1
    < 64c7ed611929ea5178fbb69b5a5f29cc9cc7c157  2016-05-27-raspbian-jessie.zip
    ---
    > 64c7ed611929ea5178fbb69b5a5f29cc9cc7c157
    ashburndave@dphnuc:~/Downloads/rasptemp$ 
    ashburndave@dphnuc:~/Downloads/rasptemp$ 
    ashburndave@dphnuc:~/Downloads/rasptemp$ df -h
    Filesystem      Size  Used Avail Use% Mounted on
    /dev/sdb2       204G   51G  143G  27% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    udev            7.8G  4.0K  7.8G   1% /dev
    tmpfs           1.6G  1.3M  1.6G   1% /run
    none            5.0M     0  5.0M   0% /run/lock
    none            7.9G  152K  7.9G   1% /run/shm
    none            100M   44K  100M   1% /run/user
    /dev/sdb1       511M  3.4M  508M   1% /boot/efi
    ashburndave@dphnuc:~/Downloads/rasptemp$ 
    ashburndave@dphnuc:~/Downloads/rasptemp$ df -h
    Filesystem      Size  Used Avail Use% Mounted on
    /dev/sdb2       204G   51G  143G  27% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    udev            7.8G  4.0K  7.8G   1% /dev
    tmpfs           1.6G  1.5M  1.6G   1% /run
    none            5.0M     0  5.0M   0% /run/lock
    none            7.9G  152K  7.9G   1% /run/shm
    none            100M   44K  100M   1% /run/user
    /dev/sdb1       511M  3.4M  508M   1% /boot/efi
    /dev/sdd1        15G   32K   15G   1% /media/ashburndave/6533-3264
    ashburndave@dphnuc:~/Downloads/rasptemp$ 
    ashburndave@dphnuc:~/Downloads/rasptemp$ umount /dev/sdd1
    ashburndave@dphnuc:~/Downloads/rasptemp$ dd bs=4M status=progress if=~/2016-05-27-raspbian-jessie.img of=/dev/sdd
    dd: invalid status flag: ‘progress’
    Try 'dd --help' for more information.
    ashburndave@dphnuc:~/Downloads/rasptemp$ dd bs=4M if=./2016-05-27-raspbian-jessie.img of=/dev/sdd
    dd: failed to open ‘/dev/sdd’: Permission denied
    ashburndave@dphnuc:~/Downloads/rasptemp$ sudo dd bs=4M if=./2016-05-27-raspbian-jessie.img of=/dev/sdd
    958+1 records in
    958+1 records out
    4019191808 bytes (4.0 GB) copied, 335.599 s, 12.0 MB/s
    ashburndave@dphnuc:~/Downloads/rasptemp$ sync
    ashburndave@dphnuc:~/Downloads/rasptemp$ 
    shburndave@dphnuc:~/Downloads/rasptemp$ man eject
    ashburndave@dphnuc:~/Downloads/rasptemp$ eject /dev/sdd
    eject: unable to open `/dev/sdd'
    ashburndave@dphnuc:~/Downloads/rasptemp$ eject /dev/sdd1
    eject: unable to open `/dev/sdd'
    ashburndave@dphnuc:~/Downloads/rasptemp$ 
    ashburndave@dphnuc:~/Downloads/rasptemp$ sudo eject /dev/sdd
    [sudo] password for ashburndave: 
    ashburndave@dphnuc:~/Downloads/rasptemp$ 
    
## Running a script file on the Raspberry Pi

After I ran raspi-config (to set the hostname and edit the localization settings), I ran a script file containing these commands (the actual script file has a blank line between each command, to make the output more readable).

    date
    uptime
    hostname
    hostname -I
    uname -a
    cat /proc/cpuinfo | tail -3
    vcgencmd version
    vcgencmd get_lcd_info
    vcgencmd measure_temp
    java -version
    javac -version
    git --version
    df -k
    ls -latr ~
    ls -latr /
    ls -latr /boot
    ifconfig
    tvservice -n
    tvservice -s
    tvservice -a
    tvservice -m CEA && tvservice -m DMT
    tvservice -d edid.dat
    edidparser edid.dat
    
The above commands produced this output.


