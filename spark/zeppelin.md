### download bin tar package

### config

  cp conf/zeppelin-env.sh.template conf/zeppelin-env.sh
  vim zeppelin-env.sh

```
export ZEPPELIN_PORT=18080
export JAVA_HOME=/usr/java/jdk
export SPARK_HOME=/opt/cloud/spark
export HADOOP_CONF_DIR=/etc/hadoop/conf

```
### start/stop

  ./bin/zeppelin-daemon.sh start
  ./bin/zeppelin-daemon.sh stop

ref:

    http://www.makedatauseful.com/python-spark-sql-zeppelin-tutorial/
    http://www.makedatauseful.com/zeppelin-notebook-tutorial-walkthrough/
    http://hortonworks.com/hadoop-tutorial/hello-world-an-introduction-to-hadoop-hcatalog-hive-and-pig/#section_8
