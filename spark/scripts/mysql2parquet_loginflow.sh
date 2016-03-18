#!/bin/bash
dir=/root/works/python/tasks
logdir=/var/log/sparklog
t=$1
m=$2
/opt/cloud/spark/bin/spark-submit \
--master yarn-client \
--executor-memory 13g \
--driver-memory 10g \
--conf spark.cores.max=25 \
$dir/spark_py/bblink/back/mysql2parquet_login_flow.py \
$t \
$m >> $logdir/mysql2parquet_login_flow.log










