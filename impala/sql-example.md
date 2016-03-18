### sql example

  alter table back_portal_wechatflowlog  drop if exists partition(dat='2015112615')
  alter table test add if not exists partition (dat = '0')


  hdfs   impala   15315930 2015-12-10 14:15 /impala/parquet/site/site-adPlayv1/dat=20151209/d8453f83d2dfd7f3-b3229734e7e9884_1623831366_data.0.parq
 -rw-r--r--   3 hdfs   impala   15011212 2015-12-10 14:15 /impala/parquet/site/site-adPlayv1/dat=20151209/d8453f83d2dfd7f3-b3229734e7e9885_927941101_data.0.parq
 -rw-r--r--   3 hdfs   impala   15367057 2015-12-10 14:15 /impala/parquet/site/site-adPlayv1/dat=20151209/d8453f83d2dfd7f3-b3229734e7e9886_1154323467_data.0.parq

### set parquet compression codec

  set PARQUET_COMPRESSION_CODEC=gzip;

### timestampe in bigint format

  select from_unixtime(cast(createtime/1000 +3600*8 as int),'yyyy-MM-dd') from site_adloadv1 where hosid='132' and dat='20151220';

### add columns

  alter table tb_external add columns(testc string,testc2 bigint)

### other

  select from_unixtime(cast((a.login_time/1000+8*3600) as BIGINT),"yyyy-MM"),count(distinct a.mac)   from back_portal_loginlog a
  where a.dat='20150731'
  and a.mac not in (select distinct mac from back_portal_loginlog where dat='20150731' and from_unixtime(cast((login_time/1000+8*3600) as BIGINT),"yyyy-MM")<'2015-07')
  and from_unixtime(cast((a.login_time/1000+8*3600) as BIGINT),"yyyy-MM")='2015-07'

  group by from_unixtime(cast((a.login_time/1000+8*3600) as BIGINT),"yyyy-MM")
