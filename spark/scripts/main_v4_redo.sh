#!/bin/bash
/opt/cloud/spark/bin/spark-submit --master yarn-client --executor-memory 13g --driver-memory 30g --conf spark.cores.max=25 spark_v4/v4mainredo.py $1 $2 & 
