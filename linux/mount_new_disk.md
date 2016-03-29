## check new disk

  fdisk -l

```
Disk /dev/xvda: 21.5 GB, 21474836480 bytes
255 heads, 63 sectors/track, 2610 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00073f45

    Device Boot      Start         End      Blocks   Id  System
/dev/xvda1   *           1        2611    20970496   83  Linux

Disk /dev/xvdb: 53.7 GB, 53687091200 bytes
255 heads, 63 sectors/track, 6527 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

```

got new disk sign /dev/xvdb

## fdisk /dev/xvdb

```
Device contains neither a valid DOS partition table, nor Sun, SGI or OSF disklabel
Building a new DOS disklabel with disk identifier 0x016f0ed9.
Changes will remain in memory only, until you decide to write them.
After that, of course, the previous content won't be recoverable.

Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

WARNING: DOS-compatible mode is deprecated. It's strongly recommended to
         switch off the mode (command 'c') and change display units to
         sectors (command 'u').

Command (m for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 1
First cylinder (1-6527, default 1):
Using default value 1
Last cylinder, +cylinders or +size{K,M,G} (1-6527, default 6527):
Using default value 6527

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
```
type n ,1,enter,enter,w

# rechek disks

  fdisk -l

```
Disk /dev/xvda: 21.5 GB, 21474836480 bytes
255 heads, 63 sectors/track, 2610 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00073f45

    Device Boot      Start         End      Blocks   Id  System
/dev/xvda1   *           1        2611    20970496   83  Linux

Disk /dev/xvdb: 53.7 GB, 53687091200 bytes
255 heads, 63 sectors/track, 6527 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x016f0ed9

    Device Boot      Start         End      Blocks   Id  System
/dev/xvdb1               1        6527    52428096   83  Linux
```

## format

  mke2fs -t ext4 /dev/xvdb1

## mount

  mke2fs -t ext4 /dev/xvdb1

got error msg:

```
mount: can't find /dev/xvdb1 in /etc/fstab or /etc/mtab
```

  vim /etc/fstab

add line at the end

  /dev/xvdb1      /data   ext4    defaults        0       0

## check disk

  df -lh
