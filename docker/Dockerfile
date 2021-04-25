FROM centos/systemd

RUN yum update -y systemd && \
	yum install -y epel-release && \
	yum install -y git initscripts psmisc net-tools

RUN cd /root/ && git clone https://github.com/gsarioz/sysbuttons.git && /bin/bash /root/sysbuttons/docker/docker_install.sh

WORKDIR /root

CMD ["php-fpm && nginx"]
