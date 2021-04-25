FROM centos/systemd

RUN yum update -y systemd && \
	yum install epel-release && \
	yum install -y git init-scripts

RUN git clone https://github.com/gsarioz/sysbuttons.git && /bin/bash $HOME/sysbuttons/install.sh
RUN systemctl enable php-fpm && systemctl enable nginx

WORKDIR /root

CMD ["/usr/sbin/init"]
