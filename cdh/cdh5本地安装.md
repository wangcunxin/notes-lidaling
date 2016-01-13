## tar包下载 地址

	http://archive.cloudera.com/cdh5/repo-as-tarball/ rpm包下载

	http://archive.cloudera.com/cdh5/parcels/latest/  parcel包下载
	http://archive-primary.cloudera.com/cm5/redhat/6/x86_64/cm/5/RPMS/x86_64/ cm rpm包下载 

## 本地仓库创建 

准备一台主机,性能一般即可

	yum install epel-release
	yum install nginx
	yum install createrepo
	
	vim /etc/selinux/config
	set SELINUX=disabled

	chkconfig iptables off
	vim /etc/nginx/conf.d/default.conf

	root /var/http/pub;
	autoindex 	on;
	
	chkconfig ntpd on
	vim /etc/ntp.conf
	set server 3.cn.pool.ntp.org



## mysql安装 

## cm安装 

##　cdh安装　

## 遇到的问题

## hue 
http://stackoverflow.com/questions/30571124/cdh-5-4-upgrade-to-hue-to-3-8
http://www.cloudera.com/content/cloudera/en/developers/home/developer-admin-resources/get-started-with-hadoop-tutorial.html


ref:

## cdh安装

	http://blog.csdn.net/hua840812/article/details/27704025
	http://blog.csdn.net/kissmelove01/article/details/44680255
	http://blog.csdn.net/hualiu163/article/details/46659375
	http://blog.csdn.net/forest_boy/article/details/5636696
	http://itindex.net/detail/51928-cloudera-manager-cdh5

## spark hadoop 部分安装 

	http://blog.javachen.com/2013/04/06/install-cloudera-cdh-by-yum

uninstall cdh:http://www.cloudera.com/content/cloudera/en/documentation/cloudera-manager/v4-latest/Cloudera-Manager-Installation-Guide/cmig_uninstall_CM.html
