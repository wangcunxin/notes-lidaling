#debian interface config

## interafce

```
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
#iface eth0 inet dhcp
iface eth0 inet static
address	192.168.0.237
netmask	255.255.255.0
gateway	192.168.0.1

```


## nameserver

	cd /etc/resolvconf/resolv.conf.d
    sudo vim tail
    
```shell
    nameserver 210.22.70.3
```
