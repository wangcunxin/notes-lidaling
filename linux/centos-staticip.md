### static ip for centos

  vim /etc/sysconfig/network-scripts/ifcfg-eth0

notes;

- make sure mac adrr same with default ifconfig showing

```
DEVICE="eth0"
ONBOOT=yes
HWADDR=A4:BA:DB:37:F1:04
TYPE=Ethernet
BOOTPROTO=static

IPADDR=192.168.1.44
NETMASK=255.255.255.0
```

```
DEVICE="eth0"
NM_CONTROLLED="yes"
ONBOOT=yes
HWADDR="00:0C:29:09:34:F5"
TYPE="Ethernet"
BOOTPROTO=static
UUID="0ae59800-0964-4476-b887-c281186786e0"
IPADDR=192.168.1.26
NETMASK=255.255.255.0
```

ref https://gist.github.com/fernandoaleman/2172388
