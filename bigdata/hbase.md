  create 'tbname','cfamilyname'

  list

  scan 'tbname'

  # clean table data
  truncate 'tbname'

### using impala query hbase

- create table in hive

```
  CREATE EXTERNAL TABLE ttyh.event_app(
       id BIGINT,  
       name STRING)
  ROW FORMAT SERDE 'org.apache.hadoop.hive.hbase.HBaseSerDe'
  STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
  WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key, app:eName")
  TBLPROPERTIES("hbase.table.name" = "eventlog");


  CREATE EXTERNAL TABLE ttyh.event_app(
       id BIGINT,
       name string,
       type string,
       content string)
  ROW FORMAT SERDE 'org.apache.hadoop.hive.hbase.HBaseSerDe'
  STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
  WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key, app:eName, app:eType, app:eContent")
  TBLPROPERTIES("hbase.table.name" = "eventlog");

```

- fresh metadata in impala-shell

  invalidate metadata;


---

  CREATE EXTERNAL TABLE ttyh.cats(
       id BIGINT,
       value string)
  ROW FORMAT SERDE 'org.apache.hadoop.hive.hbase.HBaseSerDe'
  STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
  WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cfamily:cats_json")
  TBLPROPERTIES("hbase.table.name" = "cats");
