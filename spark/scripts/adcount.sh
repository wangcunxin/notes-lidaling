#!/bin/sh
/opt/cloud/spark/bin/spark-submit --master yarn-client  --executor-memory 8g --driver-memory 8g --conf spark.cores.max=24 /root/works/python/tasks/spark_py/bblink/back/adcount.py $1>> /var/log/sparklog/advcount.log &
