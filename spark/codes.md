### read hbase with python

%pyspark

from pyspark.sql.types import *

keyConv = "org.apache.spark.examples.pythonconverters.ImmutableBytesWritableToStringConverter"
valueConv = "org.apache.spark.examples.pythonconverters.HBaseResultToStringConverter"

cmdata_conf = {"hbase.zookeeper.property.clientPort":"2181","zookeeper.znode.parent": "/hbase", "hbase.zookeeper.quorum": "slave0", "hbase.mapreduce.inputtable":"eventlog", "hbase.mapreduce.scan.columns": "info:Tenure info:Age"}

cmdata_rdd = sc.newAPIHadoopRDD("org.apache.hadoop.hbase.mapreduce.TableInputFormat","org.apache.hadoop.hbase.io.ImmutableBytesWritable","org.apache.hadoop.hbase.client.Result",keyConverter=keyConv,valueConverter=valueConv,conf=cmdata_conf)

output = cmdata_rdd.collect()
print len(output)
