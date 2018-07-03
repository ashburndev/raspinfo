Here are the URLs for downloading the current or past versions of Raspberry Pi Operating Systems directly from the Raspberry Pi Foundation.

    https://www.raspberrypi.org/downloads/
    https://www.raspberrypi.org/downloads/raspbian/
    https://www.raspberrypi.org/downloads/noobs/
    
    https://www.raspberrypi.org/downloads/raspberry-pi-desktop/
    
    http://downloads.raspberrypi.org/raspbian/images/
    http://downloads.raspberrypi.org/raspbian_lite/images/
    http://downloads.raspberrypi.org/NOOBS/images/
    http://downloads.raspberrypi.org/NOOBS_lite/images/
    
    http://downloads.raspberrypi.org/raspbian/images/raspbian-2018-03-14/
    http://downloads.raspberrypi.org/raspbian/images/raspbian-2018-04-19/
    http://downloads.raspberrypi.org/raspbian/images/raspbian-2018-06-29/
    
    https://www.raspbian.org/RaspbianImages

Here is a sample of the Raspbian OS images I have downloaded recently.

    -rw-rw-r--  1 ashburndave ashburndave     187320 Jul  2 06:52 2018-03-13-raspbian-stretch.info
    -rw-rw-r--  1 ashburndave ashburndave 1776280071 Jul  2 06:58 2018-03-13-raspbian-stretch.zip
    -rw-rw-r--  1 ashburndave ashburndave         74 Jul  2 06:59 2018-03-13-raspbian-stretch.zip.sha1
    -rw-rw-r--  1 ashburndave ashburndave         98 Jul  2 06:59 2018-03-13-raspbian-stretch.zip.sha256
    -rw-rw-r--  1 ashburndave ashburndave        473 Jul  2 06:59 2018-03-13-raspbian-stretch.zip.sig
    -rw-rw-r--  1 ashburndave ashburndave      34143 Jul  2 06:59 2018-03-13-raspbian-stretch.zip.torrent

Here is Linux example of confirming the contents of the download by comparing the posted sha256 value with the computed sha254 value.




Here is a Linux example of listing the contents of the zip file and then extracting the contents of the zip file

    ashburndave@dphnuc4:~/Downloads/tmp$ ls -latr
    total 1734672
    -rw-rw-r-- 1 ashburndave ashburndave 1776280071 Jul  2 06:58 2018-03-13-raspbian-stretch.zip
    drwxr-xr-x 3 ashburndave ashburndave      12288 Jul  3 06:41 ..
    drwxr-xr-x 2 ashburndave ashburndave       4096 Jul  3 06:42 .
    ashburndave@dphnuc4:~/Downloads/tmp$ 
    ashburndave@dphnuc4:~/Downloads/tmp$ unzip -l 2018-03-13-raspbian-stretch.zip 
    Archive:  2018-03-13-raspbian-stretch.zip
      Length      Date    Time    Name
    ---------  ---------- -----   ----
    4949278720  2018-03-13 19:17   2018-03-13-raspbian-stretch.img
    ---------                     -------
    4949278720                     1 file
    ashburndave@dphnuc4:~/Downloads/tmp$ 
    ashburndave@dphnuc4:~/Downloads/tmp$ unzip 2018-03-13-raspbian-stretch.zip 
    Archive:  2018-03-13-raspbian-stretch.zip
      inflating: 2018-03-13-raspbian-stretch.img  
    ashburndave@dphnuc4:~/Downloads/tmp$ 
    ashburndave@dphnuc4:~/Downloads/tmp$ ls -latr
    total 6567956
    -rw-r--r-- 1 ashburndave ashburndave 4949278720 Mar 13 19:17 2018-03-13-raspbian-stretch.img
    -rw-rw-r-- 1 ashburndave ashburndave 1776280071 Jul  2 06:58 2018-03-13-raspbian-stretch.zip
    drwxr-xr-x 3 ashburndave ashburndave      12288 Jul  3 06:41 ..
    drwxr-xr-x 2 ashburndave ashburndave       4096 Jul  3 06:43 .
    ashburndave@dphnuc4:~/Downloads/tmp$ 
