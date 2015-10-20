ref: http://m.oschina.net/blog/186337

## create table

```
DROP TABLE IF EXISTS tab1;
-- EXTERNAL子句表示数据位于 Impala 数据文件中央位置之外
-- 并且 Impala 中表删除后，原始数据文件仍然存在
-- 我们假定 LOCATION 子句中指定的目录是存在的
CREATE EXTERNAL TABLE tab1
(
   id INT,
   col_1 BOOLEAN,
   col_2 DOUBLE,
   col_3 TIMESTAMP
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/cloudera/sample_data/tab1';
```

不使用external 子句表示数据统一由impala管理 。不再在创建表时读取已经存在的数据文件 ，而是创建表后再载入数据。

```
create table tab3(
	id int,
	col_1 boolean,
	col_2 double,
	month int,
	day int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
```

## upload data to dest dir

	$ hdfs dfs -put tab1.csv /user/cloudera/sample_data/tab1
	$ hdfs dfs -ls /user/cloudera/sample_data/tab1

Then ,it is OK.

You can query now.
