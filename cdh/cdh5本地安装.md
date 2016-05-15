## tar包下载 地址

- cm 包下载

http://archive-primary.cloudera.com/cm5/redhat/6/x86_64/cm/5/RPMS/x86_64/ cm rpm包下载

	wget -r -np -nH -A rpm -R index.html -P /var/http/pub http://archive-primary.cloudera.com/cm5/redhat/6/x86_64/cm/5/RPMS/x86_64/

- parcel包下载·「如果服务器网络很好，不建议下载，通过cm 下载即可」
	http://archive.cloudera.com/cdh5/parcels/latest/  parcel包下载

## prehandle

	yum install epel-release
	yum install createrepo

## 本地仓库创建 （准备一台主机,性能一般即可）

	cd /var/http/pub
	createrepo .

##  disable SELINUX

	vim /etc/selinux/config
	set SELINUX=disabled

## disable iptables

	chkconfig iptables off

## nginx

	yum install nginx
	vim /etc/nginx/conf.d/default.conf

```
	root /var/http/pub;
	autoindex 	on;
```

	service nginx restart

## mysql
```
create database amon DEFAULT CHARACTER SET utf8;
create database rman DEFAULT CHARACTER SET utf8;
create database metastore DEFAULT CHARACTER SET utf8;
create database sentry DEFAULT CHARACTER SET utf8;
create database nav DEFAULT CHARACTER SET utf8;
create database navms DEFAULT CHARACTER SET utf8;
create database ooziedata DEFAULT CHARACTER SET utf8;
create database monitordata DEFAULT CHARACTER SET utf8;

grant all on amon.* TO 'root'@'master' IDENTIFIED BY 'root20160324';
grant all on rman.* TO 'root'@'master' IDENTIFIED BY 'root20160324';
grant all on metastore.* TO 'root'@'master' IDENTIFIED BY 'root20160324';
grant all on sentry.* TO 'root'@'master' IDENTIFIED BY 'root20160324';
grant all on nav.* TO 'root'@'master' IDENTIFIED BY 'root20160324';
grant all on navms.* TO 'root'@'master' IDENTIFIED BY 'root20160324';
grant all on ooziedata.* TO 'root'@'master' IDENTIFIED BY 'root20160324';
grant all on monitordata.* TO 'root'@'master' IDENTIFIED BY 'root20160324';
```
## ntpd

- auto on

	chkconfig ntpd on

- config

	vim /etc/ntp.conf
	set server 3.cn.pool.ntp.org

## mysql安装

	yum install mysql-server

## jdk installation

- jdk

	yum search oracle
	yum install oracle-j2sdk1.7.x86_64

- install mysql connector

	cd $JAVA_HOME/jre/lib/ext
	wget http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.18/mysql-connector-java-5.1.18.jar

## cm安装

- install

	yum install -y cloudera-manager-daemons cloudera-manager-server

- init

	/usr/share/cmf/schema/scm_prepare_database.sh mysql -uroot -p --scm-host localhost scm scm scm

- start

	service cloudera-scm-server start

## install cdh

	access http://host:7180
