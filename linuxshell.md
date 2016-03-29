- cut

	cat acinfo.csv | cut -d ',' -f 1|sort -u|wc -l


- sed

	ref:http://coolshell.cn/articles/9104.html
	sed -i 's/^/idfield,/' ulog_20150*.csv
	sed -i 's/id'

- netcat

	netcat -u host port
	# without -u ,netcat using tcp protocal

- grep

	tail -f file | grep --line-buffered -C 3 my_pattern
	grep -B 3 partern file
	grep -A 3 partern file
	grep -C 3 partern file

- deb

uninstall open-jdk

	sudo apt-get purge openjdk-\*

set defaut java

		update-alternatives --install /usr/bin/java java  /usr/local/common/j2sdk1.4.2_18/bin/java 300
		update-alternatives --install /usr/bin/javac javac /usr/local/common/j2sdk1.4.2_18/bin/javac 300

- rpm


- locate

	find file by filename

- httpie

one human http tool like curl

	http --verbose post http://112.65.205.80:12048/router/52a2a103d3744fb5e3ac9e857ce6e671/auth/whitelist?partner=2014071717480672279 macs:='[""]'

set headers

	http --verbose --ignore-stdin --json post http://192.168.0.95:30000/data datatype=hosWiFiLogWechatFlow time=2015-09-12 23:44:45 data:='["eyJnd0lkIjoiQiIsImhvc0lkIjoiYmJsaW5rLWhvc2lkIiwic3VwcElkIjoiMCIsInVzZXJNYWMiOiIwMDpGRjpDQzpBQTpFRSIsInR5cGUiOiIxLXRlc3QiLCJsb2dUaW1lIjoxNDQ4NTAwNjgyMDAwLCJhdXRoVHlwZSI6IiJ9"]' from=portal Content-Type:application/vnd.bblink.remote-access.v1+json

- network

nc

	# receiver
	nc -l -p 5555 -q 2 >/tmp/test.csv
	# sender
	nc ip port < file

other commands:

	tcpdump
	wireshark

- user

execute commands as a different user

	su - $user -c '$commands'

### check dir size

	# view total size
	du -sh
	# view every dir size
	du -ch
	# in order
	du -ch |sort -hr
	# in order limit depth
	du --max-depth=1 -ch|sort -hr

### termianl power tools

- oh my zsh
- oh my fish

## shell script

- readcsv with index increment

	cat log_user.csv |while read a; do vara=$((vara+1)); echo "$a:$vara"; done

## alow nopassword sudo

运行 'sudo visudo' 并添加

  your-username ALL=NOPASSWD: /sbin/poweroff


## daemon grant to user

	sudo usermod -aG docker lidl

## linux ssh

	ssh -v username@host

	```
	linux服务器上在/etc/ssh目录下存在两个配置文件一个是ssh_config，一个是sshd_config。区别就在于d上，带d的是ssh服务使用的配置文件，不带的是ssh客户端程序使用的
	```

	验证的时候启用的GSSAPIAuthentication验证方式,如果验证失败或其他原因异常，则会导致整个ssh 连接变慢


## watch

watch files dir specify

	watch -n 1 'ls -al'
