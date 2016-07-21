#!/bin/sh
dateStrStart=$(date -d '-1 day' '+%Y%m%d')
dateStrEnd=$(date '+%Y%m%d')
dateStart=`date +%s -d $dateStrStart`
dateEnd=`date +%s -d $dateStrEnd`

echo 'dest date is '$dateStrStart
echo '{createTime:{$gte:'$dateStart',$lt:'$dateEnd'}}'

/opt/mongodb/bin/mongoexport -h 112.65.205.87 --port 30000 -d bblinklogs -c sitePVv3 -u bblink_logs -p Bblink#2015$ --type=csv -q '{createTime:{$gte:'$dateStart'000,$lt:'$dateEnd'000}}' --fields pid,guuid,guuidCTime,pageTitle,url,referer,prevPID,prevTime,sw,sh,ip,createTime,language,cookieEnabled,ua,uuid,uuidCTime --out ~/$dateStrStart.csv
