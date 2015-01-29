#!/usr/bin/env bash

hostname=$1

echo $hostname

cat > /etc/sysconfig/network <<EOF
NETWORKING=yes
HOSTNAME=$hostname
RES_OPTIONS="single-request-reopen"
EOF

cat > /etc/hosts <<EOF
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
33.33.33.100 $hostname
EOF

hostname $hostname

/etc/init.d/network restart