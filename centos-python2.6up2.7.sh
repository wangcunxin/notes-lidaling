#!/bin/bash

yum -y update
yum groupinstall -y 'development tools'

yum install -y zlib-devel bzip2-devel openssl-devel xz-libs wget

wget http://www.python.org/ftp/python/2.7.8/Python-2.7.8.tar.xz

xz -d Python-2.7.8.tar.xz

tar -xvf Python-2.7.8.tar

# 进入目录:
cd Python-2.7.8
# 运行配置 configure:
./configure --prefix=/usr/local
# 编译安装:
make
make altinstall

mv /usr/bin/python /usr/bin/python.bak

ln -s /usr/local/bin/python2.7  /usr/bin/python

sed -i '1s/usr\/bin\/python/usr\/bin\/python2.6/' /usr/bin/yum