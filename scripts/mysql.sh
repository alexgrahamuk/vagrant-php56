#!/usr/bin/env bash
echo ">>> Installing MySql"
yum -y install mysql-server

cat > /etc/my.cnf <<EOF
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0
bind-address = 0.0.0.0

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
EOF

service mysqld restart

chkconfig mysqld on

PASSWORD='careers'

# Test if MySql root password is set
mysql -uroot -p$PASSWORD > /dev/null 2>&1
ROOT_PASSWORD_SET=$?

if [[ $ROOT_PASSWORD_SET -ne 0 ]]; then

	/usr/bin/mysqladmin -u root password $PASSWORD
	/usr/bin/mysqladmin -u root -h careers.dev password $PASSWORD

fi

# Test if MySql password is set
mysql -ucareers -p$PASSWORD > /dev/null 2>&1
MYSQL_PASSWORD_SET=$?

if [[ $MYSQL_PASSWORD_SET -ne 0 ]]; then

	Q1="CREATE DATABASE ncareern;"
	Q2="CREATE DATABASE ncareern_test;"
	Q3="CREATE USER 'careers'@'localhost' IDENTIFIED BY 'careers';"
	Q4="GRANT ALL PRIVILEGES ON *.* TO 'careers'@'localhost';"
	Q5="FLUSH PRIVILEGES;"
	SQL="${Q1}${Q2}${Q3}${Q4}${Q5}"

	mysql -uroot -p$PASSWORD -e "$SQL"

fi
