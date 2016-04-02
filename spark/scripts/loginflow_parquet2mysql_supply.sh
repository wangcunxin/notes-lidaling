#!/bin/bash
dir=/root/works/python/tasks
logdir=/var/log/sparklog
#ymd=`date -d "-1 day" +%Y%m%d`
ymd=$1
/opt/cloud/spark/bin/spark-submit \
--master yarn-client \
--executor-memory 13g \
--driver-memory 10g \
--conf spark.cores.max=25 \
$dir/spark_py/bblink/back/loginflowlog2mysql_update.py \
$ymd \
spark://master:7077 >> $logdir/loginflowlog2mysql.log &

