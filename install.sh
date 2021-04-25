#!/bin/bash
echo "Installation is starting" && \
\
yum install -y epel-release && \
yum install -y nginx php-fpm && \
\
mkdir -p /var/www && \
cp -r $HOME/sysbuttons/html /var/www && \
chown apache.apache /var/www -R && \
chmod 755 /var/www -R && \
\
rm -rfv /etc/nginx/nginx.conf && \
rm -rfv /etc/nginx/*default* && \
rm -rfv /etc/nginx/conf.d && \
cp -r $HOME/sysbuttons/nginx/nginx.conf /etc/nginx.conf && \
\
sed -i s/"expose_php = Off"/"expose_php = On"/g /etc/php.ini && \
sed -i s/".php3"/".html"/g /etc/php-fpm.d/www.conf && \
\
systemctl enable nginx && systemctl restart nginx && \
systemctl enable php-fpm && systemctl restart nginx && \
\
echo "Installation is Completed"
