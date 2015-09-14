
ref :http://www.cnblogs.com/ggjucheng/archive/2013/01/04/2844673.html

## create table

```
CREATE TABLE login (
  uid  BIGINT,
  ip  STRING
)
PARTITIONED BY (dt STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
```

## load data to table

	LOAD DATA LOCAL INPATH '/data/login/20130101.csv' OVERWRITE INTO TABLE login PARTITION (dt='20130101');

表示从本地磁盘，把文件 '/data/login/20130101.csv' 拷贝到表login，分区dt为'20130101'的目录(在HDFS)下.加载成功后，20130101.csv会放置在 hdfs://namenode:9000/user/hadoop/warehouse/login/dt=20130101/20130101.csv。

OVERWRITE表示目标表(或分区)在数据加载前会删除，然后替换为新的数据。如果不指定OVERWRITE，则会追加数据到目标表(或分区)下，如果文件名和目标目录的文件冲突，会自动改名。

LOCAL如果不指定，就是从HDFS的'/data/login/20130101.csv'移动数据到表login，分区分区dt为'20130101'的目录下。即是，原来的HDFS文件'/data/login/20130101.csv'是被移动到hdfs://namenode:9000/user/hadoop/warehouse/login/dt=20130101/20130101.csv。

注意：加载的文件名不能是一个子目录，hive做一些最简单的检查，以确保正在加载的文件和目标表匹配。目前，它会检查，如果该表存储为sequencefile格式 - 正在加载的文件是反序列化。


