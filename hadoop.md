### shell list

	hdfs namenode -format
	hdfs dfsadmin -report
	hdfs dsf -mkdir /input
	hdfs dfs -ls /input
	hdsf dfs -rm /input
	hdfs dfs -ls -h /input

	hadoop-daemon.sh start datanode
	hdfs dsfadmin -refreshNodes
	hdfs dfsadmin -safemode get

- check hdfs avaliable size

	su hdfs -c 'hdfs dfs -df -h'
	su hdfs -c 'hdfs dfsadmin -report'

### add datanode
需要 将hadoop 目录 拷贝至目录主机，然后 把 dfs/name/current/VERSION 里的namespaceId行内容 拷贝至目录主机相同文件中

### ref linux shell

create user with group:

	sudo addgroup impala
	sudo adduser -ingroup impala

- add user and group on redhat

	groupadd <groupname>
	useradd -g <groupname> username

create user and groupname same as username ,and without home dir ,password:

	useradd impala -M -s /bin/bash -p '*'

delete user:

	sudo userdel -r impala

### ssh-copy-id

	ssh-copy-id -i .ssh/filename.pub user@server

### check hdfs dir size

	hdfs dfs -du [-s] [-h] URI [URI …]

### yarn application manager

- show apps

	yarn application -list

- kill one app with appid

	yarn application -kill $appid

if hadoop version is less than 2.3.0 

	hadoop job -list
	hadoop job -kill $jobid
