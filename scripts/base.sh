#!/usr/bin/env bash

echo ">>> Updating CentOS System"
yum -y update

echo ">>> Installing base packages"
# Add the EPEL repo https://fedoraproject.org/wiki/EPEL
yum -y install epel-release
yum -y groupinstall "Development Tools"
yum -y install git vim tmux man

cat > /etc/profile.d/careers.sh <<EOF
export APPLICATION_ENVIRONMENT=development
EOF