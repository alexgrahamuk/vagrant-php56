#!/usr/bin/env bash
echo ">>> Installing PHP"

# PHP 5.6 yum repo
rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
yum -y install php56w php56w-opcache php56w-mcrypt php56w-mysql php56w-xml php56w-process php56w-pear

cat > /etc/php.d/careers.ini <<EOF
display_errors = On
date.timezone = "Europe/London"
EOF