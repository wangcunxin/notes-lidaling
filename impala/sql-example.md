### sql example

  alter table back_portal_wechatflowlog  drop if exists partition(dat='2015112615')
  alter table test add if not exists partition (dat = '0')


  hdfs   impala   15315930 2015-12-10 14:15 /impala/parquet/site/site-adPlayv1/dat=20151209/d8453f83d2dfd7f3-b3229734e7e9884_1623831366_data.0.parq
 -rw-r--r--   3 hdfs   impala   15011212 2015-12-10 14:15 /impala/parquet/site/site-adPlayv1/dat=20151209/d8453f83d2dfd7f3-b3229734e7e9885_927941101_data.0.parq
 -rw-r--r--   3 hdfs   impala   15367057 2015-12-10 14:15 /impala/parquet/site/site-adPlayv1/dat=20151209/d8453f83d2dfd7f3-b3229734e7e9886_1154323467_data.0.parq