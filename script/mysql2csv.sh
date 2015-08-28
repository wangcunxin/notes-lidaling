#!/bin/bash
DATADATE=`date +%Y-%m-%d --date='-30 day'`
DEST_DIR=/mysqldump
SUC_LOG="$DEST_DIR"/"$DATADATE"_exp_suc.log
ERR_LOG="$DEST_DIR"/"$DATADATE"_exp_err.log
exec 1>$SUC_LOG
exec 2>$ERR_LOG
echo "ready ..."

PASSWD=admin123

/usr/local/mysql/bin/mysql -u root -p$PASSWD -D bblink_piwik -e "select l1.idsite,hex(l1.idvisitor) as idvisitor,convert_tz(l1.server_time,'+00:00','+08:00') as server_time,UNIX_TIMESTAMP(convert_tz(l1.server_time,'+00:00','+08:00')) as server_time_long,'' as title,l2.name as url,
l3.referer_url,'' as time_spent_ref, 
concat_ws('@',l3.config_os,l3.config_os_version,l3.config_browser_name,l3.config_browser_version,l3.config_device_type,l3.config_device_brand,l3.config_device_model) as useragent,
l3.config_resolution,INET6_NTOA(l3.location_ip) as ip,
'' as gw_id,'' as version,'' as uuidctime,
'' as language,'' as cookieenabled,'' as dnstime,'' as connecttime,'' as requesttime,'' as loadtime,l1.idlink_va,l1.idvisit,l1.idaction_url,l1.idaction_url_ref,l1.time_spent_ref_action
from bblink_piwik.piwik_log_link_visit_action  l1
left join bblink_piwik.piwik_log_action l2 on l1.idaction_url = l2.idaction
left join bblink_piwik.piwik_log_visit l3 on l1.idvisit = l3.idvisit
where l1.server_time >= DATE_ADD('"$DATADATE"',INTERVAL -8 HOUR)
and l1.server_time < DATE_ADD('$DATADATE',INTERVAL 16 HOUR)
INTO OUTFILE '"$DEST_DIR/$DATADATE".csv' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'";

cd $DEST_DIR
zip -r "$DATADATE".zip ./*
find .|grep -v '.zip'|xargs rm -fr
