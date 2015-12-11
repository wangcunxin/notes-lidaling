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

### site-sitePVv3


DROP TABLE IF EXISTS parquetdb.site_sitePVv3;
CREATE external TABLE parquetdb.site_sitePVv3(
  site_id STRING,    site_uuid STRING,    site_uuid_ctime STRING,    ptitle STRING,    url STRING,    referrer STRING,    prevpid STRING,    attime SMALLINT,    resolution STRING,    ip STRING,    ctime STRING,    language STRING,    cookie_enabled STRING,    ua STRING,    uuid STRING,    uuid_ctime STRING,    browser STRING,    os STRING,    tag_key STRING,    supp_id STRING,    gw_id STRING,    portal_version STRING,    from_page STRING,    channel_id STRING,    channel_list_id STRING,    content_id STRING,    advid STRING,    appid STRING,    spenttime SMALLINT,    assingleaccess STRING,    asfirstaccess STRING,    aslastaccess STRING
)
partitioned by (dat string)
stored as parquet
LOCATION '/impala/parquet/site/site-sitePVv3';

DROP TABLE IF EXISTS txtdb.site_sitePVv3;
CREATE external TABLE txtdb.site_sitePVv3(

  site_id STRING,    site_uuid STRING,    site_uuid_ctime STRING,    ptitle STRING,    url STRING,    referrer STRING,    prevpid STRING,    attime SMALLINT,    resolution STRING,    ip STRING,    ctime STRING,    language STRING,    cookie_enabled STRING,    ua STRING,    uuid STRING,    uuid_ctime STRING,    browser STRING,    os STRING,    tag_key STRING,    supp_id STRING,    gw_id STRING,    portal_version STRING,    from_page STRING,    channel_id STRING,    channel_list_id STRING,    content_id STRING,    advid STRING,    appid STRING,    spenttime SMALLINT,    assingleaccess STRING,    asfirstaccess STRING,    aslastaccess STRING
)
partitioned by (dat string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/impala/txt/site/site-sitePVv3';

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
LOCATION '/impala/txt/site/site-adPlayv1';

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

## loginlog

drop table if exists txtdb.back_portal_loginlog;
CREATE EXTERNAL TABLE txtdb.back_portal_loginlog(
    portal STRING,
    id STRING,    
    gw_id STRING,    
    user_id STRING,    
    user_name STRING,    
    login_time BIGINT,    
    logout_time BIGINT,    
    mac STRING,    
    ip STRING,    
    user_agent STRING,    
    download_flow INT,    
    upload_flow INT,    
    os STRING,    
    browser STRING,    
    ratio STRING,    
    batch_no STRING,    
    user_type STRING,    
    supp_id STRING )
partitioned by (dat STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/impala/txt/back/back-portal-loginlog';

drop table if exists parquetdb.back_portal_loginlog;
CREATE EXTERNAL TABLE parquetdb.back_portal_loginlog(   
  portal STRING,    
  id STRING,    
  gw_id STRING,    
  user_id STRING,    
  user_name STRING,    
  login_time BIGINT,    
  logout_time BIGINT,    
  mac STRING,    
  ip STRING,    
  user_agent STRING,    
  download_flow INT,    
  upload_flow INT,    
  os STRING,    
  browser STRING,    
  ratio STRING,    
  batch_no STRING,    
  user_type STRING,    
  supp_id STRING )
partitioned by (dat STRING)
stored as parquet
LOCATION '/impala/parquet/back/back-portal-loginlog';

### back-portal-authorizedlog

drop table if exists txtdb.back_portal_authorizedlog;
create EXTERNAL table txtdb.back_portal_authorizedlog(
  dfrom string,
  id string,
  userId string,
  gwId string,
  userType string,
  userMac string,
  authorizeTime bigint,
  createTime bigint,
  success string,
  hosId string
  )
  partitioned by (dat STRING)
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
  LOCATION '/impala/txt/back/back-portal-authorizedlog';

  drop table if exists parquetdb.back_portal_authorizedlog;
  create EXTERNAL table parquetdb.back_portal_authorizedlog(
    dfrom string,
    id string,
    userId string,
    gwId string,
    userType string,
    userMac string,
    authorizeTime bigint,
    createTime bigint,
    success string,
    hosId string
    )
    partitioned by (dat STRING)
    stored as parquet
    LOCATION '/impala/parquet/back/back-portal-authorizedlog';

--- the view

CREATE VIEW IF NOT EXISTS simpledata.back_portal_authorizedlog
  AS select * from parquetdb.back_portal_authorizedlog union select * from  txtdb.back_portal_authorizedlog

### pageflowv1

create EXTERNAL table txtdb.site_pageflowv1(
       flowid string,
       name string,
       guuid string,
       guuidCTime bigint,
       url string ,
       hosid string,
       gwid string,
       createTime bigint)
  partitioned by (dat STRING)
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
  LOCATION '/impala/txt/site/site-pageflowv1';

  create EXTERNAL table parquetdb.site_pageflowv1(
         flowid string,
         name string,
         guuid string,
         guuidCTime bigint,
         url string ,
         hosid string,
         gwid string,
         createTime bigint)
partitioned by (dat STRING)
stored as parquet
LOCATION '/impala/parquet/site/site-pageflowv1';

--- the view

CREATE VIEW IF NOT EXISTS simpledata.site-pageflowv1
 AS select * from parquetdb.site_pageflowv1 union select * from  txtdb.site_pageflowv1

### back_portal_loginflowlog


drop table if exists parquetdb.back_portal_loginflowlog;
create external table parquetdb.back_portal_loginflowlog(
dfrmm string,logType string,hosId string,suppId string,gwId string,userMac string,loginVersion string,forwardVersion string,arriveVersion string,loginType string,isNewUser string,logTime bigint
)
partitioned by (dat string)
stored as parquet
location '/impala/parquet/back/back-portal-loginflowlog'


drop table if exists txtdb.back_portal_loginflowlog;
create external table txtdb.back_portal_loginflowlog(
  dfrom string,logType string,hosId string,suppId string,gwId string,userMac string,loginVersion string,forwardVersion string,arriveVersion string,loginType string,isNewUser string,logTime bigint
  )
  partitioned by (dat string)
  row format delimited fields terminated by '\t'
  location '/impala/txt/back/back-portal-loginflowlog'

# back_portal_wechatflowlog


drop table if exists parquetdb.back_portal_wechatflowlog;
create external table parquetdb.back_portal_wechatflowlog(
  dfrom string,gwId string,hosId string,suppId string,userMac string,type string,logTime bigint,authType string
)
partitioned by (dat string)
stored as parquet
location '/impala/parquet/back/back-portal-wechatflowlog'


drop table if exists txtdb.back_portal_wechatflowlog;
create external table txtdb.back_portal_wechatflowlog(
  dfrom string,gwId string,hosId string,suppId string,userMac string,type string,logTime bigint,authType string
  )
  partitioned by (dat string)
  row format delimited fields terminated by '\t'
  location '/impala/txt/back/back-portal-wechatflowlog'

### back-hoswifi-wechatAttentionAdd

drop table if exists parquetdb.back_hoswifi_wechatAttentionAdd;
create external table parquetdb.back_hoswifi_wechatAttentionAdd(
  dfrom string,openId string,appId string,hosId string,gwId string,suppId string,attentionTime bigint,logTime bigint,userAgent string
)
partitioned by (dat string)
stored as parquet
location '/impala/parquet/back/back-hoswifi-wechatAttentionAdd'

drop table if exists txtdb.back_hoswifi_wechatAttentionAdd;
create external table txtdb.back_hoswifi_wechatAttentionAdd(
  dfrom string,openId string,appId string,hosId string,gwId string,suppId string,attentionTime bigint,logTime bigint,userAgent string
)
partitioned by (dat string)
row format delimited fields terminated by '\t'
location '/impala/txt/back/back-hoswifi-wechatAttentionAdd'


### back-hoswifi-wechatAttention

drop table if exists parquetdb.back_hoswifi_wechatAttention;
create external table parquetdb.back_hoswifi_wechatAttention(
  dfrom string,follow string,loginVersion string,arriveVersion string, hosId string,appId string,weixinWifiShopid string,weixinWifiBssid string,originId string,weixinWifiSsid string,openId string,gwId string,suppId string,logTime bigint,url string,userAgent string
)
partitioned by (dat string)
stored as parquet
location '/impala/parquet/back/back-hoswifi-wechatAttention'

drop table if exists txtdb.back_hoswifi_wechatAttention;
create external table txtdb.back_hoswifi_wechatAttention(
  dfrom string,follow string,loginVersion string,arriveVersion string, hosId string,appId string,weixinWifiShopid string,weixinWifiBssid string,originId string,weixinWifiSsid string,openId string,gwId string,suppId string,logTime bigint,url string,userAgent string

)
partitioned by (dat string)
row format delimited fields terminated by '\t'
location '/impala/txt/back/back-hoswifi-wechatAttention'

### model [template]

drop table if exists parquetdb.back_portal_loginflowlog;
create external table parquetdb.back_portal_loginflowlog(
  dfrom string,logType string,hosId string,suppId string,gwId string,userMac string,loginVersion string,forwardVersion string,arriveVersion string,loginType string,isNewUser string,logTime bigint
)
partitioned by (dat string)
stored as parquet
location '/impala/parquet/back/back-portal-loginflowlog'

drop table if exists txtdb.back_portal_loginflowlog;
create external table txtdb.back_portal_loginflowlog(
  dfrom string,logType string,hosId string,suppId string,gwId string,userMac string,loginVersion string,forwardVersion string,arriveVersion string,loginType string,isNewUser string,logTime bigint
)
partitioned by (dat string)
row format delimited fields terminated by '\t'
location '/impala/txt/back/back-portal-loginflowlog'

### add partition

  alter table wxConcatFollowMACv3 add partition(dat ='20151016');
  #create one partition if not exists ,if exists no creatation
  alter table test add if not exists partition (dat = '0');

### load data into table

  load data inpath '/logs_origin/back/back-wechatNewFanDetails/20151016' into table wechatNewFanDetails partition(dat = '20151016');
