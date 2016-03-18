#!/bin/sh
#/opt/cloud/spark/bin/spark-submit --master yarn-client  --executor-memory 8g --driver-memory 8g --conf spark.cores.max=24 /root/works/python/bin_adv/spark_adv/adformongo.py >> /var/log/sparklog/adv.log &

/opt/cloud/spark/bin/spark-submit --master yarn-client  --executor-memory 8g --driver-memory 8g --conf spark.cores.max=24 /root/works/python/tasks/spark_py/bblink/back/adcount.py >> /var/log/sparklog/adv.log &
