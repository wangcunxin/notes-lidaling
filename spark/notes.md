### 关于PID设置

```

在集群所有节点都设置$SPARK_PID_DIR， $HADOOP_PID_DIR和$YARN_PID_DIR即可。

修改hadoop-env.sh，增加：

export HADOOP_PID_DIR=/home/ap/cdahdp/app/pids

修改yarn-env.sh，增加：

export YARN_PID_DIR=/home/ap/cdahdp/app/pids

修改spark-env.sh，增加：

export SPARK_PID_DIR=/home/ap/cdahdp/app/pids

```
