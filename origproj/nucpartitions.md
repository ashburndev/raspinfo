# NUC partitions

    ashburndave@dphnuc:~$ 
    ashburndave@dphnuc:~$ df -k
    Filesystem     1K-blocks     Used Available Use% Mounted on
    /dev/sdb2      213662952 53288404 149497980  27% /
    none                   4        0         4   0% /sys/fs/cgroup
    udev             8164420        4   8164416   1% /dev
    tmpfs            1635936     1320   1634616   1% /run
    none                5120        0      5120   0% /run/lock
    none             8179680      152   8179528   1% /run/shm
    none              102400       64    102336   1% /run/user
    /dev/sdb1         523248     3428    519820   1% /boot/efi
    /dev/sda1      944863636  4280800 892563484   1% /media/ashburndave/853ba065-079d-434a-9235-27e9f3d74216
    ashburndave@dphnuc:~$ 
    ashburndave@dphnuc:~$ df -h
    Filesystem      Size  Used Avail Use% Mounted on
    /dev/sdb2       204G   51G  143G  27% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    udev            7.8G  4.0K  7.8G   1% /dev
    tmpfs           1.6G  1.3M  1.6G   1% /run
    none            5.0M     0  5.0M   0% /run/lock
    none            7.9G  152K  7.9G   1% /run/shm
    none            100M   64K  100M   1% /run/user
    /dev/sdb1       511M  3.4M  508M   1% /boot/efi
    /dev/sda1       902G  4.1G  852G   1% /media/ashburndave/853ba065-079d-434a-9235-27e9f3d74216
    ashburndave@dphnuc:~$ 
    ashburndave@dphnuc:~$ sudo parted -l
    Model: ATA WDC WD10JPVX-22J (scsi)
    Disk /dev/sda: 1000GB
    Sector size (logical/physical): 512B/4096B
    Partition Table: msdos
    
    Number  Start   End     Size    Type      File system     Flags
     1      1049kB  983GB   983GB   primary   ext4            boot
     2      983GB   1000GB  17.1GB  extended
     5      983GB   1000GB  17.1GB  logical   linux-swap(v1)
    
    
    Model: ATA Crucial_CT240M50 (scsi)
    Disk /dev/sdb: 240GB
    Sector size (logical/physical): 512B/4096B
    Partition Table: gpt
    
    Number  Start   End    Size    File system     Name  Flags
     1      1049kB  538MB  537MB   fat32                 msftdata
     2      538MB   223GB  222GB   ext4
     3      223GB   240GB  17.1GB  linux-swap(v1)
    
    
    ashburndave@dphnuc:~$ sudo fdisk -l
    
    Disk /dev/sda: 1000.2 GB, 1000204886016 bytes
    255 heads, 63 sectors/track, 121601 cylinders, total 1953525168 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 4096 bytes
    I/O size (minimum/optimal): 4096 bytes / 4096 bytes
    Disk identifier: 0x000d7570
    
       Device Boot      Start         End      Blocks   Id  System
    /dev/sda1   *        2048  1920120831   960059392   83  Linux
    /dev/sda2      1920122878  1953523711    16700417    5  Extended
    Partition 2 does not start on physical sector boundary.
    /dev/sda5      1920122880  1953523711    16700416   82  Linux swap / Solaris
    
    WARNING: GPT (GUID Partition Table) detected on '/dev/sdb'! The util fdisk doesn't support GPT. Use GNU Parted.
    
    
    Disk /dev/sdb: 240.1 GB, 240057409536 bytes
    255 heads, 63 sectors/track, 29185 cylinders, total 468862128 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 4096 bytes
    I/O size (minimum/optimal): 4096 bytes / 4096 bytes
    Disk identifier: 0x00000000
    
       Device Boot      Start         End      Blocks   Id  System
    /dev/sdb1               1   468862127   234431063+  ee  GPT
    Partition 1 does not start on physical sector boundary.
    ashburndave@dphnuc:~$ 
    ashburndave@dphnuc:~$ cat /proc/partitions
    major minor  #blocks  name
    
       8        0  976762584 sda
       8        1  960059392 sda1
       8        2          1 sda2
       8        5   16700416 sda5
       8       16  234431064 sdb
       8       17     524288 sdb1
       8       18  217203712 sdb2
       8       19   16701440 sdb3
    ashburndave@dphnuc:~$ 
    ashburndave@dphnuc:~$ 
    
