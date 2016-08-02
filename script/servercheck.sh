#!/bin/sh
# ref https://bash.cyberciti.biz/guide/The_case_statement
if [ -z $1 ]
then
  server="*** Unknown vehicle ***"
  echo $server
  exit
elif [ -n $1 ]
then
  server=$1
fi
current=`date "+%Y-%m-%d %H:%M:%S"`     #获取当前时间，例：2015-03-11 12:33:41       
timeStamp=`date -d "$current" +%s`      #将current转换为时间戳，精确到秒
currentTimeStamp=$((timeStamp*1000+`date "+%N"`/1000000)) #将current转换为时间戳，精确到毫秒
case $server in
	server1)       
	    curl -s -I http://121.42.200.139/mvc/searchUsersForH5?$currentTimeStamp|grep HTTP/
	    ;;
	server2)
	    curl -s -I http://121.42.222.222/mvc/searchUsersForH5?$currentTimeStamp|grep HTTP/
	    ;;            
	test)       
	    curl -s -I http://139.129.27.32/mvc/searchUsersForH5?$currentTimeStamp|grep HTTP/
	    ;;
	local)       
	    curl -s -I http://localhost:8080/mvc/searchUsersForH5?$currentTimeStamp|grep HTTP/
	    ;;
	all)
	    curl -s -I http://www.ttyhuo.cn/mvc/searchUsersForH5?$currentTimeStamp|grep HTTP/
	    ;;
	*)              
esac
