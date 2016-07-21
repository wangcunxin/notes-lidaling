#!/bin/bash

USER=root
PASSWD=admin123
DATABASE=ddd
FILENAME="trucks"

DATADATE=`date +%Y-%m-%d --date='-1 day'`
DEST_DIR=/mysqldump
SUC_LOG="$DEST_DIR"/"$DATADATE"_exp_suc.log
ERR_LOG="$DEST_DIR"/"$DATADATE"_exp_err.log
exec 1>$SUC_LOG
exec 2>$ERR_LOG
echo "ready ..."

SQL="SELECT t.TruckID,t.UserId,t.LicensePlate,t.LoadLimit,t.TruckLength,t.TruckWidth,t.TruckHeight,t.TruckType,t.ModelNumber,t.ReleaseYear,t.SeatingCapacity,
t.TruckStatus,t.CreateDate,t.CreateTime,unix_timestamp(t.CreateTime),t.DisableTime,t.Memo,t.isDefault,t.DirverPoneNo,t.DirverName,t.isVerifyTruck,t.fromcity,t.tocity,u.Memo FROM app_ttyhuo.truck t 
left join app_ttyhuo.user u 
on t.UserID=u.UserID"

/usr/local/mysql/bin/mysql -u$USER -p$PASSWD -D $DATABASE -e "$SQL INTO OUTFILE '"$DEST_DIR/$DATADATE".csv' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'";

cd $DEST_DIR
zip -r "$DATADATE".zip ./*
find .|grep -v '.zip'|xargs rm -fr
