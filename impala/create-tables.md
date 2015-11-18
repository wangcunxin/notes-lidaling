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

### log_login_flow
drop table if exists txtdb.back_portal_loginflowlog;
create EXTERNAL table txtdb.back_portal_loginflowlog(
  dfrom string,
log_id	bigint,
log_type	string,
session_id	string,
hos_id	bigint,
supp_id	bigint,
gw_id	string,
gw_mac	string,
gw_ip	string,
ap_mac	string,
ap_ip	string,
bssid	string,
ssid	string,
user_mac	string,
user_ip	string,
login_version	string,
forward_version	string,
arrive_version	string,
in_page_url	string,
out_page_url	string,
this_page_url	string,
user_agent	string,
login_type	string,
user_id	bigint,
is_new_user	string,
mobile	string,
auth_code	string,
user_in_auth_code	string,
captcher_ask	string,
captcher_result	string,
user_in_captcher_result	string,
auth_request	string,
auth_reponse	string,
auth_status	string,
auth_fail_count	int,
mp_app_id	string,
user_open_id	string,
attention_status	string,
request	string,
reponse	string,
remark	string,
log_time	bigint
)
partitioned by (dat STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/impala/txtdb/back/back-portal-loginflowlog';

drop table if exists parquetdb.back_portal_loginflowlog;
create EXTERNAL table parquetdb.back_portal_loginflowlog(
  dfrom string,
log_id	bigint,
log_type	string,
session_id	string,
hos_id	bigint,
supp_id	bigint,
gw_id	string,
gw_mac	string,
gw_ip	string,
ap_mac	string,
ap_ip	string,
bssid	string,
ssid	string,
user_mac	string,
user_ip	string,
login_version	string,
forward_version	string,
arrive_version	string,
in_page_url	string,
out_page_url	string,
this_page_url	string,
user_agent	string,
login_type	string,
user_id	bigint,
is_new_user	string,
mobile	string,
auth_code	string,
user_in_auth_code	string,
captcher_ask	string,
captcher_result	string,
user_in_captcher_result	string,
auth_request	string,
auth_reponse	string,
auth_status	string,
auth_fail_count	int,
mp_app_id	string,
user_open_id	string,
attention_status	string,
request	string,
reponse	string,
remark	string,
log_time	bigint
)
partitioned by (dat STRING)
stored as parquet
LOCATION '/impala/parquet/back/back-portal-loginflowlog';

--- the view

CREATE VIEW IF NOT EXISTS simpledata.back_portal_loginflowlog
  AS select * from parquetdb.back_portal_loginflowlog union select * from  txtdb.back_portal_loginflowlog


### log_user

drop table if exists txtdb.back_portal_userloginlog;
create EXTERNAL table txtdb.back_portal_userloginlog(
  dfrom string,
  user_type	string,
  user_name	string,
  user_id	bigint,
  user_agent	string,
  upload_flow	bigint,
  supp_id	bigint,
  session_id	string,
  ratio	string,
  os	string,
  mac	string,
  logout_time	bigint,
  login_time	bigint,
  log_id	bigint,
  ip	string,
  hos_id	bigint,
  gw_id	string,
  download_flow	bigint,
  browser	string,
  batch_no	string
  )
  partitioned by (dat STRING)
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
  LOCATION '/impala/txtdb/back/back-portal-userloginlog';


drop table if not exists parquetdb.back_portal_userloginlog;
create EXTERNAL table parquetdb.back_portal_userloginlog(
  dfrom string,
  user_type	string,
  user_name	string,
  user_id	bigint,
  user_agent	string,
  upload_flow	bigint,
  supp_id	bigint,
  session_id	string,
  ratio	string,
  os	string,
  mac	string,
  logout_time	bigint,
  login_time	bigint,
  log_id	bigint,
  ip	string,
  hos_id	bigint,
  gw_id	string,
  download_flow	bigint,
  browser	string,
  batch_no	string
  )
  partitioned by (dat STRING)
  stored as parquet
  LOCATION '/impala/parquet/back/back-portal-userloginlog';

--- the view
CREATE VIEW IF NOT EXISTS simpledata.back_portal_userloginlog
  AS select * from parquetdb.back_portal_userloginlog union select * from  txtdb.back_portal_userloginlog


### log_wechat_flow


drop table if exists txtdb.back_portal_wechatlog;
create EXTERNAL table txtdb.back_portal_wechatlog(
  dfrom string,
  log_id	bigint,
  session_id	string,
  gw_id	string,
  hos_id	bigint,
  gw_ip	string,
  gw_mac	string,
  supp_id	string,
  ap_mac	string,
  ap_ip	string,
  bssid	string,
  ssid	string,
  user_mac	string,
  open_id	string,
  mp_app_id	string,
  request	string,
  response	string,
  type	string,
  log_time	bigint
  )
  partitioned by (dat STRING)
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
  LOCATION '/impala/txt/back/back-portal-wechatlog';

  drop table if exists parquetdb.back_portal_wechatlog;
  create EXTERNAL table parquetdb.back_portal_wechatlog(
    dfrom string,
    log_id	bigint,
    session_id	string,
    gw_id	string,
    hos_id	bigint,
    gw_ip	string,
    gw_mac	string,
    supp_id	string,
    ap_mac	string,
    ap_ip	string,
    bssid	string,
    ssid	string,
    user_mac	string,
    open_id	string,
    mp_app_id	string,
    request	string,
    response	string,
    type	string,
    log_time	bigint
    )
    partitioned by (dat STRING)
    stored as parquet
    LOCATION '/impala/parquet/back/back-portal-wechatlog';

--- the view

CREATE VIEW IF NOT EXISTS simpledata.back_portal_wechatlog
  AS select * from parquetdb.back_portal_wechatlog union select * from  txtdb.back_portal_wechatlog


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
       guuidCTime string,
       url string ,
       hosid string,
       gwid string,
       createTime string  
  )
  partitioned by (dat STRING)
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
  LOCATION '/impala/txt/site/site-pageflowv1';



  create EXTERNAL table parquetdb.site_pageflowv1(
         flowid string,
         name string,
         guuid string,
         guuidCTime string,
         url string ,
         hosid string,
         gwid string,
         createTime string  
    )
partitioned by (dat STRING)
stored as parquet
LOCATION '/impala/parquet/site/site-pageflowv1';

--- the view

CREATE VIEW IF NOT EXISTS simpledata.site-pageflowv1
 AS select * from parquetdb.site_pageflowv1 union select * from  txtdb.site_pageflowv1


### add partition

  alter table wxConcatFollowMACv3 add partition(dat ='20151016');
  #create one partition if not exists ,if exists no creatation
  alter table test add if not exists partition (dat = '0');

### load data into table

  load data inpath '/logs_origin/back/back-wechatNewFanDetails/20151016' into table wechatNewFanDetails partition(dat = '20151016');
