### EXTERNAL table back_wechatNewFanDetails
```
DROP TABLE IF EXISTS back_wechatNewFanDetails;
CREATE EXTERNAL TABLE back_wechatNewFanDetails
(
  dfrom string,
  id string,
  openid string,
  appid string,
  hosid string,
  gwid string,
  supplierid string,
  subscribeTime BIGINT,
  ua string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/logs_origin/back/back-wechatNewFanDetails/20151016';
```

### inner table with partition
```
DROP TABLE IF EXISTS back_wechatNewFanDetails;
CREATE EXTERNAL TABLE back_wechatNewFanDetails
(
  dfrom string,
  id string,
  openid string,
  appid string,
  hosid string,
  gwid string,
  supplierid string,
  subscribeTime BIGINT,
  ua string
)
partitioned by (dat string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/impala/tbs/back/back-wechatNewFanDetails';

/**
 { "key": "wxConcatFollowMAC", "desc": "微信连关注日志有MAC", "logVer": "v3", "fields":
 [ "pid", "follow", "mac", "r302url", "uuid", "guuid", "ip", "ua", "createTime", "url","loginV","portalV","hosId","appId","weixin_wifi_shopId","weixin_wifi_bssid","originid","weixin_wifi_ssid","openId","gwid"  ] }

    { "key": "wxConcatFollow", "desc": "微信连关注日志", "logVer": "v3", "fields": [ "pid", "follow", "uuid", "guuid", "ip", "ua", "createTime", "url","loginV","portalV","hosId","appId","weixin_wifi_shopId","weixin_wifi_bssid","originid","weixin_wifi_ssid","openId","gwid" ] },
*/

DROP TABLE IF EXISTS site_wxConcatFollow;
CREATE EXTERNAL TABLE site_wxConcatFollow(
  dfrom string,
  pid string,
  follow smallint,
  uuid string,
  guuid string,
  ip string,
  ua string,
  createTime BIGINT,
  url string,
  loginV string,
  portalV string,
  hosId string,
  appId string,
  weixin_wifi_shopId string,
  weixin_wifi_bssid string,
  originid string,
  weixin_wifi_ssid string,
  openId string,
  gwid string
)
partitioned by (dat string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/impala/tbs/site/site-wxConcatFollowv3';

```

```
DROP TABLE IF EXISTS site-sitePVv3;
CREATE TABLE site-sitePVv3(
  pid string,
  guuid string,
  guuidCTime int,
  uuid string,
  uuidCTime string,
  ip string,
  ua string,
  createTime int,
  pageTitle string,
  url string,
  referer string,
  language string,
  cookieEnabled string,
  sw smallint,
  sh smallint,
  prevPID smallint,
  prevTime smallint
)
partitioned by (dat string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/impala/tbs/site/site-sitePVv3';
```

### adLoad

drop table if EXISTS txtdb.site_adLoadv1;
CREATE EXTERNAL TABLE txtdb.site_adLoadv1(
    uid string,
    adid string,
    guuid string,
    guuidCTime BIGINT,
    url string,
    referer string,
    hosid string,
    gwid string,
    ua string,
    ip string,
    createTime BIGINT
  )
partitioned by (dat string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/impala/txt/site/site-adLoadv1';

drop table if EXISTS parquetdb.site_adLoadv1;
CREATE EXTERNAL TABLE parquetdb.site_adLoadv1(
    uid string,
    adid string,
    guuid string,
    guuidCTime BIGINT,
    url string,
    referer string,
    hosid string,
    gwid string,
    ua string,
    ip string,
    createTime BIGINT
  )
partitioned by (dat string)
stored as parquet
LOCATION '/impala/parquet/site/site-adLoadv1';

## adclick

drop table if EXISTS txtdb.site_adClickv1;
CREATE EXTERNAL TABLE txtdb.site_adClickv1(
  uid string,
  adid string,
  guuid string,
  createTime BIGINT
  )
partitioned by (dat string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/impala/txt/site/site-adClickv1';

drop table if EXISTS parquetdb.site_adClickv1;
CREATE EXTERNAL TABLE parquetdb.site_adClickv1(
  uid string,
  adid string,
  guuid string,
  createTime BIGINT
  )
partitioned by (dat string)
stored as parquet
LOCATION '/impala/parquet/site/site-adClickv1';

## adplay

drop table if EXISTS txtdb.site_adPlayv1;
CREATE EXTERNAL TABLE txtdb.site_adPlayv1(
  uid string,
  adid string,
  guuid string,
  createTime BIGINT
  )
partitioned by (dat string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/impala/txt/site/site-adPlayv1site-adClickv1';

drop table if EXISTS parquetdb.site_adPlayv1;
CREATE EXTERNAL TABLE parquetdb.site_adPlayv1(
  uid string,
  adid string,
  guuid string,
  createTime BIGINT
  )
partitioned by (dat string)
stored as parquet
LOCATION '/impala/parquet/site/site-adPlayv1';

### add partition

  alter table wxConcatFollowMACv3 add partition(dat ='20151016');

### load data into table

  load data inpath '/logs_origin/back/back-wechatNewFanDetails/20151016' into table wechatNewFanDetails partition(dat = '20151016');