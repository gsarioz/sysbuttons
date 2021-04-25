FROM centos/systemd

RUN yum update -y systemd && \
	yum install -y epel-release && \
	yum install -y git init-scripts

RUN cd /root/ && git clone https://github.com/gsarioz/sysbuttons.git && /bin/bash /root/sysbuttons/install.sh
RUN systemctl enable php-fpm && systemctl enable nginx

WORKDIR /root

CMD ["/usr/sbin/init"]
