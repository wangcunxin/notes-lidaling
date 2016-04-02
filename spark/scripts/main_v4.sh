#!/bin/bash
/opt/cloud/spark/bin/spark-submit --master yarn-client --executor-memory 13g --driver-memory 10g --conf spark.cores.max=25 /root/works/python/bin_v4/spark_v4/v4main.py
