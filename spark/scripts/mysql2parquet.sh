#!/bin/bash
begin=`date -d "-1 day" +%Y%m%d`
end=`date +%Y%m%d`

bash /root/works/python/tasks/loginflow/mysql2parquet_loginflow.sh $begin $end > /var/log/sparklog/job.loginflow.log
bash /root/works/python/tasks/loginflow/mysql2parquet_wechatflow.sh $begin $end > /var/log/sparklog/job.wechatflow.log

