FROM centos/systemd

RUN yum update -y systemd && \
	yum install -y epel-release && \
	yum install -y git initscripts psmisc net-tools

RUN cd /root && git clone https://github.com/gsarioz/sysbuttons.git

RUN echo "Installation is starting" && \
\
yum install -y epel-release && \
yum install -y nginx php-fpm && \
\
mkdir -p /var/www && \
cp -r $HOME/sysbuttons/html /var/www/ && \
chown apache.apache /var/www -R && \
chmod 755 /var/www -R && \
\
rm -rfv /etc/nginx/nginx.conf && \
rm -rfv /etc/nginx/*default* && \
rm -rfv /etc/nginx/conf.d && \
cp -r $HOME/sysbuttons/nginx/nginx.conf /etc/nginx/nginx.conf && \
\
sed -i s/"expose_php = Off"/"expose_php = On"/g /etc/php.ini && \
sed -i s/".php3"/".html"/g /etc/php-fpm.d/www.conf && \
sed -i s/";security"/"security"/g /etc/php-fpm.d/www.conf && \
\
echo "Installation is Completed"

RUN touch /tmp/startup.sh && chmod 777 /tmp/startup.sh && echo "#!/bin/bash" >> /tmp/startup.sh && echo "/usr/sbin/php-fpm &" >> /tmp/startup.sh && echo "/usr/sbin/nginx &" >> /tmp/startup.sh

WORKDIR /root

CMD ["/tmp/startup.sh"]
