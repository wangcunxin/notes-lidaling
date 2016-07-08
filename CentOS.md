# CentOS

## epel-release

EPEL的全称叫 Extra Packages for Enterprise Linux 。EPEL是由 Fedora 社区打造，为 RHEL 及衍生发行版如 CentOS、Scientific Linux 等提供高质量软件包的项目。装上了 EPEL之后，就相当于添加了一个第三方源。

	yum install epel-release

比如 刚刚安装后的centos是无法 安装 nginx的。安装 epel后 即可以安装 nginx了

## history with time

	echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bash_profile

	or add in /etc/profile
