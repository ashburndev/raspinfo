# raspinfo
a simple Grails web application to display information about my Raspberry Pi

## Creating the micro sd card to insert into the Raspberry Pi

Using my Linux computer (an Intel NUC), I ran these commands

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

    pi@dphrpi35:~ $ date
    Mon Aug 15 07:10:59 EDT 2016
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ uptime
     07:10:59 up 1 min,  2 users,  load average: 0.32, 0.15, 0.05
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ hostname
    dphrpi35
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ hostname -I
    10.0.0.224 2601:5cc:c802:7643::ef60 2601:5cc:c802:7643:6aa7:5bed:6c80:e60d 
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ uname -a
    Linux dphrpi35 4.4.11-v7+ #888 SMP Mon May 23 20:10:33 BST 2016 armv7l GNU/Linux
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ cat /proc/cpuinfo | tail -3
    Hardware	: BCM2709
    Revision	: a22082
    Serial		: 000000001589b94e
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ vcgencmd version
    May 20 2016 19:01:31 
    Copyright (c) 2012 Broadcom
    version faf071dd4885c5ac1a89483d35a5326e7f69495f (clean) (release)
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ vcgencmd get_lcd_info
    1920 1080 24
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ vcgencmd measure_temp
    temp=58.0'C
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ java -version
    java version "1.8.0_65"
    Java(TM) SE Runtime Environment (build 1.8.0_65-b17)
    Java HotSpot(TM) Client VM (build 25.65-b01, mixed mode)
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ javac -version
    javac 1.8.0_65
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ git --version
    git version 2.1.4
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ df -k
    Filesystem     1K-blocks    Used Available Use% Mounted on
    /dev/root       15183540 3469852  11042208  24% /
    devtmpfs          469540       0    469540   0% /dev
    tmpfs             473872       0    473872   0% /dev/shm
    tmpfs             473872    6464    467408   2% /run
    tmpfs               5120       4      5116   1% /run/lock
    tmpfs             473872       0    473872   0% /sys/fs/cgroup
    /dev/mmcblk0p1     64456   20984     43472  33% /boot
    tmpfs              94776       0     94776   0% /run/user/1000
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ ls -latr ~
    total 172
    drwxr-xr-x  3 root root  4096 May 27 07:09 ..
    -rw-r--r--  1 pi   pi     675 May 27 07:09 .profile
    -rw-r--r--  1 pi   pi    3512 May 27 07:09 .bashrc
    -rw-r--r--  1 pi   pi     220 May 27 07:09 .bash_logout
    drwxr-xr-x  2 pi   pi    4096 May 27 07:40 python_games
    drwxr-xr-x  5 pi   pi    4096 May 27 07:40 Documents
    drwxr-xr-x  3 pi   pi    4096 May 27 07:40 .local
    drwxr-xr-x  2 pi   pi    4096 May 27 07:40 Desktop
    drwxr-xr-x  3 pi   pi    4096 May 27 07:40 .themes
    drwxr-xr-x  2 pi   pi    4096 May 27 07:50 Videos
    drwxr-xr-x  2 pi   pi    4096 May 27 07:50 Templates
    drwxr-xr-x  2 pi   pi    4096 May 27 07:50 Public
    drwxr-xr-x  2 pi   pi    4096 May 27 07:50 Pictures
    drwxr-xr-x  2 pi   pi    4096 May 27 07:50 Music
    drwxr-xr-x  2 pi   pi    4096 May 27 07:50 Downloads
    drwx------  3 pi   pi    4096 May 27 07:50 .dbus
    drwxr-xr-x  2 pi   pi    4096 Aug 14 10:15 .fontconfig
    drwxr-xr-x  2 pi   pi    4096 Aug 14 10:15 .gstreamer-0.10
    drwxr-xr-x  2 pi   pi    4096 Aug 14 10:30 .oracle_jre_usage
    -rw-r--r--  1 pi   pi     708 Aug 14 10:51 more
    drwxr-xr-x 11 pi   pi    4096 Aug 14 11:01 .cache
    drwx------  4 pi   pi    4096 Aug 14 11:14 .thumbnails
    -rw-r--r--  1 pi   pi      69 Aug 14 11:16 .asoundrc
    -rw-r--r--  1 pi   pi     256 Aug 14 15:30 edit.dat
    -rw-------  1 pi   pi     353 Aug 14 15:43 .xsession-errors.old
    -rw-r--r--  1 pi   pi     128 Aug 14 16:25 DELL_S2340M.dat
    -rw-r--r--  1 pi   pi    4941 Aug 14 16:29 dell.txt
    -rw-r--r--  1 pi   pi    1661 Aug 14 16:33 procinfo.txt
    -rw-r--r--  1 pi   pi      26 Aug 14 16:48 .gtkrc-2.0
    drwxr-xr-x 13 pi   pi    4096 Aug 14 16:49 .config
    -rw-r--r--  1 pi   pi    7463 Aug 15 06:48 miscinfo.txt
    -rwxrwxrwx  1 pi   pi     367 Aug 15 07:03 raspinfo.sh
    -rw-r--r--  1 pi   pi     128 Aug 15 07:04 edid.dat
    -rw-r--r--  1 pi   pi   12356 Aug 15 07:06 raspinfo.txt
    -rw-------  1 pi   pi    3501 Aug 15 07:09 .bash_history
    -rw-------  1 pi   pi     109 Aug 15 07:09 .Xauthority
    drwxr-xr-x 20 pi   pi    4096 Aug 15 07:09 .
    -rw-------  1 pi   pi     353 Aug 15 07:09 .xsession-errors
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ ls -latr /
    total 92
    drwxr-xr-x   3 root root 16384 Dec 31  1969 boot
    dr-xr-xr-x 158 root root     0 Dec 31  1969 proc
    dr-xr-xr-x  12 root root     0 Dec 31  1969 sys
    drwx------   2 root root  4096 May 27 07:04 root
    drwxr-xr-x   2 root root  4096 May 27 07:04 mnt
    drwxr-xr-x   2 root root  4096 May 27 07:04 srv
    drwxr-xr-x   2 root root  4096 May 27 07:04 media
    drwxr-xr-x   3 root root  4096 May 27 07:09 home
    drwxr-xr-x   2 root root  4096 May 27 07:22 bin
    drwxr-xr-x  19 root root  4096 May 27 07:22 lib
    drwxr-xr-x   2 root root  4096 May 27 07:22 sbin
    drwxr-xr-x  11 root root  4096 May 27 07:34 usr
    drwxr-xr-x   7 root root  4096 May 27 07:36 opt
    drwx------   2 root root 16384 May 27 07:43 lost+found
    drwxr-xr-x  11 root root  4096 May 27 07:50 var
    drwxr-xr-x  21 root root  4096 Aug 14 11:15 ..
    drwxr-xr-x  21 root root  4096 Aug 14 11:15 .
    drwxr-xr-x 110 root root  4096 Aug 15 07:09 etc
    drwxr-xr-x  15 root root  3400 Aug 15 07:09 dev
    drwxr-xr-x  21 root root   740 Aug 15 07:09 run
    drwxrwxrwt  12 root root  4096 Aug 15 07:10 tmp
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ ls -latr /boot
    total 20348
    drwxr-xr-x  3 root root   16384 Dec 31  1969 .
    -rwxr-xr-x  1 root root     136 Dec 31  1979 cmdline.txt
    -rwxr-xr-x  1 root root   18693 Aug 21  2015 COPYING.linux
    -rwxr-xr-x  1 root root    1494 Nov 18  2015 LICENCE.broadcom
    -rwxr-xr-x  1 root root 4122560 May 27 06:20 kernel.img
    -rwxr-xr-x  1 root root    9713 May 27 06:20 fixup_x.dat
    -rwxr-xr-x  1 root root    9713 May 27 06:20 fixup_db.dat
    -rwxr-xr-x  1 root root    6480 May 27 06:20 fixup.dat
    -rwxr-xr-x  1 root root    2509 May 27 06:20 fixup_cd.dat
    -rwxr-xr-x  1 root root   17932 May 27 06:20 bootcode.bin
    -rwxr-xr-x  1 root root   15081 May 27 06:20 bcm2710-rpi-3-b.dtb
    -rwxr-xr-x  1 root root   14411 May 27 06:20 bcm2709-rpi-2-b.dtb
    -rwxr-xr-x  1 root root   13101 May 27 06:20 bcm2708-rpi-cm.dtb
    -rwxr-xr-x  1 root root   13328 May 27 06:20 bcm2708-rpi-b-plus.dtb
    -rwxr-xr-x  1 root root   13065 May 27 06:20 bcm2708-rpi-b.dtb
    -rwxr-xr-x  1 root root 3887400 May 27 06:20 start_x.elf
    -rwxr-xr-x  1 root root 2743224 May 27 06:20 start.elf
    -rwxr-xr-x  1 root root 4934920 May 27 06:20 start_db.elf
    -rwxr-xr-x  1 root root  615896 May 27 06:20 start_cd.elf
    -rwxr-xr-x  1 root root 4224096 May 27 06:20 kernel7.img
    drwxr-xr-x  2 root root    8192 May 27 08:08 overlays
    -rwxr-xr-x  1 root root    1635 May 27 08:09 config.txt.orig
    -rwxr-xr-x  1 root root    1635 May 27 08:09 config.txt
    -rwxr-xr-x  1 root root   18974 May 27 08:50 LICENSE.oracle
    -rwxr-xr-x  1 root root     145 May 27 08:50 issue.txt
    drwxr-xr-x 21 root root    4096 Aug 14 11:15 ..
    -rwxr-xr-x  1 root root    1759 Aug 14 15:42 config.txt.fail
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ ifconfig
    eth0      Link encap:Ethernet  HWaddr b8:27:eb:89:b9:4e  
              inet addr:10.0.0.224  Bcast:10.0.0.255  Mask:255.255.255.0
              inet6 addr: fe80::481f:7517:28c9:331/64 Scope:Link
              inet6 addr: 2601:5cc:c802:7643:6aa7:5bed:6c80:e60d/64 Scope:Global
              inet6 addr: 2601:5cc:c802:7643::ef60/128 Scope:Global
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:64 errors:0 dropped:0 overruns:0 frame:0
              TX packets:88 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:7062 (6.8 KiB)  TX bytes:13879 (13.5 KiB)
    
    lo        Link encap:Local Loopback  
              inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
              UP LOOPBACK RUNNING  MTU:65536  Metric:1
              RX packets:144 errors:0 dropped:0 overruns:0 frame:0
              TX packets:144 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1 
              RX bytes:12112 (11.8 KiB)  TX bytes:12112 (11.8 KiB)
    
    wlan0     Link encap:Ethernet  HWaddr b8:27:eb:dc:ec:1b  
              inet6 addr: fe80::2c36:6519:fbe7:8f5f/64 Scope:Link
              UP BROADCAST MULTICAST  MTU:1500  Metric:1
              RX packets:2 errors:0 dropped:2 overruns:0 frame:0
              TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:400 (400.0 B)  TX bytes:0 (0.0 B)
    
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ tvservice -n
    device_name=DEL-DELL_S2340M
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ tvservice -s
    state 0x120006 [DVI DMT (82) RGB full 16:9], 1920x1080 @ 60.00Hz, progressive
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ tvservice -a
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ tvservice -m CEA && tvservice -m DMT
    Group CEA has 0 modes:
    Group DMT has 10 modes:
               mode 4: 640x480 @ 60Hz 4:3, clock:25MHz progressive 
               mode 6: 640x480 @ 75Hz 4:3, clock:31MHz progressive 
               mode 9: 800x600 @ 60Hz 4:3, clock:40MHz progressive 
               mode 11: 800x600 @ 75Hz 4:3, clock:49MHz progressive 
               mode 16: 1024x768 @ 60Hz 4:3, clock:65MHz progressive 
               mode 18: 1024x768 @ 75Hz 4:3, clock:78MHz progressive 
               mode 21: 1152x864 @ 75Hz 4:3, clock:108MHz progressive 
               mode 35: 1280x1024 @ 60Hz 5:4, clock:108MHz progressive 
               mode 36: 1280x1024 @ 75Hz 5:4, clock:135MHz progressive 
      (prefer) mode 82: 1920x1080 @ 60Hz 16:9, clock:148MHz progressive 
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ tvservice -d edid.dat
    Written 128 bytes to edid.dat
    pi@dphrpi35:~ $ 
    pi@dphrpi35:~ $ edidparser edid.dat
    Enabling fuzzy format match...
    Parsing edid.dat...
    HDMI:EDID version 1.3, 0 extensions, screen size 51x29 cm
    HDMI:EDID features - videodef 0x80 standby suspend active off; colour encoding:RGB444|YCbCr422; sRGB is not default colourspace; preferred format is native; does not support GTF
    HDMI:EDID found monitor S/N descriptor tag 0xff
    HDMI:EDID found monitor name descriptor tag 0xfc
    HDMI:EDID monitor name is DELL_S2340M
    HDMI:EDID found monitor range descriptor tag 0xfd
    HDMI:EDID monitor range offsets: V min=0, V max=0, H min=0, H max=0
    HDMI:EDID monitor range: vertical is 56-76 Hz, horizontal is 30-83 kHz, max pixel clock is 170 MHz
    HDMI:EDID monitor range does not support GTF
    HDMI:EDID found preferred CEA detail timing format: 1920x1080p @ 60 Hz (16)
    HDMI:EDID established timing I/II bytes are A5 4B 00
    HDMI:EDID found DMT format: code 4, 640x480p @ 60 Hz in established timing I/II
    HDMI:EDID found DMT format: code 6, 640x480p @ 75 Hz in established timing I/II
    HDMI:EDID found DMT format: code 9, 800x600p @ 60 Hz in established timing I/II
    HDMI:EDID found DMT format: code 11, 800x600p @ 75 Hz in established timing I/II
    HDMI:EDID found DMT format: code 16, 1024x768p @ 60 Hz in established timing I/II
    HDMI:EDID found DMT format: code 18, 1024x768p @ 75 Hz in established timing I/II
    HDMI:EDID found DMT format: code 36, 1280x1024p @ 75 Hz in established timing I/II
    HDMI:EDID standard timings block x 8: 0x714F 8180 D1C0 0101 0101 0101 0101 0101 
    HDMI:EDID found DMT format: code 21, 1152x864p @ 75 Hz (4:3) in standard timing 0
    HDMI:EDID found DMT format: code 35, 1280x1024p @ 60 Hz (5:4) in standard timing 1
    HDMI:EDID found DMT format: code 82, 1920x1080p @ 60 Hz (16:9) in standard timing 2
    HDMI:EDID moving support for CEA mode 16 to DMT mode 82 because sink does not support HDMI
    HDMI:EDID filtering formats with pixel clock > 162 MHz or h. blanking > 1023
    HDMI:EDID best score mode initialised to CEA (1) 640x480p @ 60 Hz with pixel clock 25 MHz (score 0)
    HDMI:EDID best score mode is now DMT (4) 640x480p @ 60 Hz with pixel clock 25 MHz (score 18432)
    HDMI:EDID best score mode is now DMT (6) 640x480p @ 75 Hz with pixel clock 31 MHz (score 23040)
    HDMI:EDID best score mode is now DMT (9) 800x600p @ 60 Hz with pixel clock 40 MHz (score 28800)
    HDMI:EDID best score mode is now DMT (11) 800x600p @ 75 Hz with pixel clock 49 MHz (score 36000)
    HDMI:EDID best score mode is now DMT (16) 1024x768p @ 60 Hz with pixel clock 65 MHz (score 47185)
    HDMI:EDID best score mode is now DMT (18) 1024x768p @ 75 Hz with pixel clock 78 MHz (score 58982)
    HDMI:EDID best score mode is now DMT (21) 1152x864p @ 75 Hz with pixel clock 108 MHz (score 99649)
    HDMI:EDID best score mode is now DMT (35) 1280x1024p @ 60 Hz with pixel clock 108 MHz (score 103643)
    HDMI:EDID DMT mode (36) 1280x1024p @ 75 Hz with pixel clock 135 MHz has a score of 98304
    HDMI:EDID best score mode is now DMT (82) 1920x1080p @ 60 Hz with pixel clock 148 MHz (score 149416)
    HDMI:EDID preferred mode is updated to DMT (82) 1920x1080p @ 60 Hz with pixel clock 148500000 Hz
    HDMI:EDID has only DVI support and no audio support
    edid_parser exited with code 0
    pi@dphrpi35:~ $ 
    
## List of my Raspberry Pi computers

| CPU HW  | CPU REV | CPU SERIAL       | HOST NAME | MAC ADDR          | IP ADDR    | CASE TYPE      | HAT  |
| ------- | ------- | ---------------- | --------- | ----------------- | ---------- | -------------- | ---- |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |
| BCM2709 | a22082  | 000000001589b94e | dphrpi35  | b8:27:eb:89:b9:4e | 10.0.0.224 | Red/White RPI3 | none |

WHEREPURCHASED, WHENPURCHASED, FIRMWAREDATE, RASPIANDATE, 

