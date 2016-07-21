#!/bin/bash

USER=root
PASSWD=admin123
DATABASE=ddd

DATADATE=`date +%Y-%m-%d --date='-1 day'`
DEST_DIR=/mysqldump
SUC_LOG="$DEST_DIR"/"$DATADATE"_exp_suc.log
ERR_LOG="$DEST_DIR"/"$DATADATE"_exp_err.log
exec 1>$SUC_LOG
exec 2>$ERR_LOG
echo "ready ..."

SQL="SELECT ProductID,ProvideUserID,ProvideUserMobileNo,Price,LimitCount,FromCity,FromAddr,FromLat,FromLng,ToCity,ToAddr,ToLat,ToLng,LoadLimit,TruckLength,trucktype,MerchandiserNum,
DepartureTime,ArrivalTime,p.Title,p.Description,p.ImgUrl,p.status,p.CreateTime,unix_timestamp(p.CreateTime),p.LastUpdateTime,unix_timestamp(p.LastUpdateTime),u.Memo FROM app_ttyhuo.product p left join app_ttyhuo.user u 
on p.ProvideUserID=u.UserID"

/usr/local/mysql/bin/mysql -u$USER -p$PASSWD -D $DATABASE -e "$SQL INTO OUTFILE '"$DEST_DIR/$DATADATE".csv' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'";

cd $DEST_DIR
zip -r "$DATADATE".zip ./*
find .|grep -v '.zip'|xargs rm -fr
