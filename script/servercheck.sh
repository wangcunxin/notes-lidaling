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
case $server in
	server1)       
	    curl http://121.42.200.139/mvc/searchUsersForH5| python -m json.tool
	    ;;
	server2)
	    curl http://121.42.222.222/mvc/searchUsersForH5| python -m json.tool
	    ;;            
	test)       
	    curl http://139.129.27.32/mvc/searchUsersForH5| python -m json.tool
	    ;;
	local)       
	    curl http://localhost:8080/mvc/searchUsersForH5| python -m json.tool
	    ;;
	*)              
esac

