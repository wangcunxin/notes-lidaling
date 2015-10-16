### EXTERNAL table
```
DROP TABLE IF EXISTS wechatNewFanDetails;
CREATE EXTERNAL TABLE wechatNewFanDetails
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
DROP TABLE IF EXISTS wechatNewFanDetails;
CREATE EXTERNAL TABLE wechatNewFanDetails
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
LOCATION '/impala/tbs/back/wechatNewFanDetails';

 { "key": "wxConcatFollowMAC", "desc": "微信连关注日志有MAC", "logVer": "v3", "fields":
 [ "pid", "follow", "mac", "r302url", "uuid", "guuid", "ip", "ua", "createTime", "url","loginV","portalV","hosId","appId","weixin_wifi_shopId","weixin_wifi_bssid","originid","weixin_wifi_ssid","openId","gwid"  ] }

DROP TABLE IF EXISTS wxConcatFollowMACv3;
CREATE EXTERNAL TABLE wxConcatFollowMACv3
(
  dfrom string,
  pid string,
  follow smallint,
  mac string,
  r302url string,
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
LOCATION '/impala/tbs/back/wechatNewFanDetails';

```
### add partition

  alter table wxConcatFollowMACv3 add partition(dat ='20151016');

### load data into table

  load data inpath '/logs_origin/back/back-wechatNewFanDetails/20151016' into table wechatNewFanDetails partition(dat = '20151016');
