#!/usr/bin/env bash
echo ">>> Installing Apache"
yum -y install httpd

# Run as vagrant user to make permissions easier to deal with
sudo sed -i "s/User apache/User vagrant/" /etc/httpd/conf/httpd.conf
sudo sed -i "s/Group apache/Group vagrant/" /etc/httpd/conf/httpd.conf

cat > /etc/httpd/conf.d/careers.conf <<EOF
SetEnv APPLICATION_ENVIRONMENT development

<VirtualHost *:80>
     ServerName careers.dev
     ServerAlias careers.dev
     DocumentRoot /careers
     <Directory /careers>
       AllowOverride All
     </Directory>
</VirtualHost>
EOF

service httpd restart

chkconfig httpd on