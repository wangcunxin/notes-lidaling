#!/bin/sh
dateStrStart=$(date -d '-1 day' '+%Y%m%d')
dateStrEnd=$(date '+%Y%m%d')
dateStart=`date +%s -d $dateStrStart`
dateEnd=`date +%s -d $dateStrEnd`

echo $dateStart
echo $dateEnd
