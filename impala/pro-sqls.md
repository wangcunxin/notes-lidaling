### back_wechatNewFanDetails

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

### site_wxConcatFollow

DROP TABLE IF EXISTS site_wxConcatFollowv3;
CREATE EXTERNAL TABLE site_wxConcatFollowv3(
  pid string,
  follow smallint,
  uuid string,
  guuid string,
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
  gwid string,
  ua string,
  ip string,
  createTime BIGINT
)
partitioned by (dat string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/impala/tbs/site/site-wxConcatFollowv3';
