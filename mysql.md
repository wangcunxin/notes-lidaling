##mysql import data from csv file:

```shell
LOAD DATA LOCAL INFILE '/path/to/your/csv/file/model.csv' INTO TABLE test.dummy FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
```

```
	mysqlimport  --ignore-lines=1 --fields-terminated-by=,
--columns='ID,Name,Phone,Address' --local -u root -p
Database /path/to/csvfile/TableName.csv
```

## modify talbe field column comment

	 ALTER TABLE `user` CHANGE `id` `id` INT( 11 ) COMMENT 'id of user'

## create database

	CREATE DATABASE IF NOT EXISTS bblink_hos DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

## create user

	create user bblink_hos@'%' identified by 'bblink_hos';

## grant privileges

	grant all privileges on bblink_hos.* to bblink_hos;

## check privileges

	grant select on *.* to 'bblink_hos'@'%' identified by 'bblink_hos'

## get table field

	select column_name from information_schema.columns where table_name='bblink_wxcity_user_info';

## create as

	create table tmp_now_mobile as select mobile from bblink_user_net_info where mobile is not null  order by create_time desc limit 5095140;

## msyqlimport

	mysqlimport  --ignore-lines=1 --fields-terminated-by=, --lines-terminated-by='\r\n' --columns='id,mobile' --local -u root -p bblink_hos /root/tmp_new_mobile.csv

## �鿴 �����ṹ

	show create table bblink_user_net_info\G;

## ���Ʊ��ṹ

	create table a select * from table b limit 0;

## show processlist

	show processlist
	SELECT * FROM information_schema.processlist WHERE `INFO` LIKE 'SELECT %';

## datetime

	UNIX_TIMESTAMP('2015-01-15 12:00:00');
	FROM_UNIXTIME(timestamp)

## UNIQUE key add

	ALTER TABLE example ADD UNIQUE KEY abc_ndx (a,b,c);

## query table name using like

	select table_name from information_schema.tables where table_name like 'log_user%';
