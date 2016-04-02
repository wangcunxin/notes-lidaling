#!/bin/sh
/opt/cloud/spark/bin/spark-submit --master yarn-client  --executor-memory 8g --driver-memory 8g --conf spark.cores.max=24 spark_adv/adformongoredo.py $1 
