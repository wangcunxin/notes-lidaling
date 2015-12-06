cdh5 uninstall

## stop service on WEB UI

	stop cluster
	stop clouder manager service

## stop service on LINUX SERVER

	service cloudera-scm-server stop
	yum remove -y cloudera-manager-server
	service cloudera-scm-agent hard_stop_confirmed
	yum remove -y 'cloudera-manager-*' avro-tools crunch flume-ng hadoop-hdfs-fuse hadoop-hdfs-nfs3 hadoop-httpfs hadoop-kms hbase-solr hive-hbase hive-webhcat hue-beeswax hue-hbase hue-impala hue-pig hue-plugins hue-rdbms hue-search hue-spark hue-sqoop hue-zookeeper impala impala-shell kite llama mahout oozie pig pig-udf-datafu search sentry solr-mapreduce spark-core spark-master spark-worker spark-history-server spark-python sqoop sqoop2 whirr hue-common oozie-client solr solr-doc sqoop2-client zookeeper
	yum clean all
	umount cm_processes
	rm -Rf /usr/share/cmf /var/lib/cloudera* /var/cache/yum/cloudera* /var/log/cloudera* /var/run/cloudera*
	rm -rf /tmp/.scm_prepare_node.lock
	rm -Rf /var/lib/flume-ng /var/lib/hadoop* /var/lib/hue /var/lib/navigator /var/lib/oozie /var/lib/solr /var/lib/sqoop* /var/lib/zookeeper
	rm -Rf /dfs /mapred /yarn
	rm -rf /etc/hadoop/ /etc/hive/ /etc/spark/ /etc/cloudera-scm-* /etc/impala/ /etc/zookeeper/
	rm -rf /opt/cloudera/
