- ntpd
- ntpdate

For the purpose to make time synchronize.One way is using ntpdate command to force time synchronized when [server booted](http://stackoverflow.com/questions/12973777/how-to-run-a-shell-script-at-startup),then start ntpd service.

	#!/bin/sh
	/usr/sbin/ntpdate 192.168.0.1

and 
	chkconfig ntpd on

## /etc/ntp.conf

```
[root@linux ~]# vi /etc/ntp.conf 
# 1. 关于权限设定部分 
#　　 权限的设定主要以 restrict 这个参数来设定，主要的语法为： 
# 　　restrict IP mask netmask_IP parameter 
# 　　其中 IP 可以是软件地址，也可以是 default ，default 就类似 0.0.0.0 
#　　 至于 paramter 则有： 
#　　　ignore　：关闭所有的 NTP 联机服务 
#　　　nomodify：表示 Client 端不能更改 Server 端的时间参数，不过，
#　　　Client 端仍然可以透过 Server 端来进行网络校时。 
#　　　notrust ：该 Client 除非通过认证，否则该 Client 来源将被视为不信任网域 
#　　　noquery ：不提供 Client 端的时间查询
#　　　notrap ：不提供trap这个远程事件登入
#　　如果 paramter 完全没有设定，那就表示该 IP (或网域)“没有任何限制”

restrict default nomodify notrap noquery　# 关闭所有的 NTP 要求封包 
restrict 127.0.0.1　　　 #这是允许本级查询
restrict 192.168.0.1 mask 255.255.255.0 nomodify 
#在192.168.0.1/24网段内的服务器就可以通过这台NTP Server进行时间同步了 
# 2. 上层主机的设定 
#　　要设定上层主机主要以 server 这个参数来设定，语法为：
#　　server [IP|HOST Name] [prefer]
#　　Server 后面接的就是我们上层 Time Server 啰！而如果 Server 参数 
#　　后面加上 perfer 的话，那表示我们的 NTP 主机主要以该部主机来作为 
#　　时间校正的对应。另外，为了解决更新时间封包的传送延迟动作， 
#　　所以可以使用 driftfile 来规定我们的主机 
#　　在与 Time Server 沟通时所花费的时间，可以记录在 driftfile  
#　　后面接的文件内，例如下面的范例中，我们的 NTP server 与  
#　　cn.pool.ntp.org联机时所花费的时间会记录在 /etc/ntp/drift文件内 
server 0.pool.ntp.org
server 1.pool.ntp.org
server 2.pool.ntp.org
server cn.pool.ntp.org prefer
#其他设置值，以系统默认值即可
server  127.127.1.0     # local clock
fudge   127.127.1.0 stratum 10
driftfile /var/lib/ntp/drift
broadcastdelay  0.008
keys /etc/ntp/keys
```

	
## other 

	ntpdstat

	ntptrace –n 127.0.0.1

	ntpq –p

ntpd service will not work if time offset is too large.
