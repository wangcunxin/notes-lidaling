### shell list

	hdfs namenode -format
	hdfs dfsadmin -report
	hdfs dsf -mkdir /input
	hdfs dfs -ls /input
	hdsf dfs -rm /input
	hdfs dfs -ls -h /input
	
	hadoop-daemon.sh start datanode
	hdfs dsfadmin -refreshNodes

### add datanode
需要 将hadoop 目录 拷贝至目录主机，然后 把 dfs/name/current/VERSION 里的namespaceId行内容 拷贝至目录主机相同文件中
