#	This	is	a	comment
FROM centos
MAINTAINER lidl <lidaling@foxmail.com>
RUN yum install -y wget
RUN wget -P /etc/yum.repos.d/ http://archive-primary.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo
RUN wget -P /etc/yum.repos.d/ http://archive-primary.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo
RUN yum install -y epel-release
RUN yum install -y nginx
RUN yum install -y python-pip
RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf
RUN mkdir -p /var/www/html && chmod a+r /var/www/html && echo "<?php phpinfo(); ?>" > /var/www/html/index.php
#RUN chkconfig supervisord on && chkconfig nginx on
RUN mkdir -p /var/log/supervisor
ADD scripts/run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
ENTRYPOINT ["/run.sh"]
