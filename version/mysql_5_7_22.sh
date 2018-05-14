#!/bin/bash -e

echo "================= setting MySQL preReqs ==================="
sudo groupadd mysql
sudo useradd -g mysql mysql
apt-get install libaio1 numactl
mkdir -p /etc/mysql
mkdir /var/log/mysql

MYSQL_VERSION=5.7.22
echo "=========== Downloading mysql $MYSQL_VERSION ==============="
cd /usr/local
wget -O mysql-"$MYSQL_VERSION"-linux-glibc2.12-x86_64.tar.gz https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-"$MYSQL_VERSION"-linux-glibc2.12-x86_64.tar.gz
tar xvfz mysql-"$MYSQL_VERSION"-linux-glibc2.12-x86_64.tar.gz
mv mysql-"$MYSQL_VERSION"-linux-glibc2.12-x86_64 mysql
rm mysql-"$MYSQL_VERSION"-linux-glibc2.12-x86_64.tar.gz
cd mysql
mkdir mysql-files
chmod 750 mysql-files
chown -R mysql .
chgrp -R mysql .

echo "================= Configuring MySQL ==================="
bin/mysqld --initialize-insecure --user=mysql
bin/mysql_ssl_rsa_setup
ln -sf /usr/local/mysql/bin/mysqld_safe /usr/bin/mysqld_safe

#create and assign permissions to directories
mkdir -p /var/log/mysql
chown -R mysql /var/log/mysql

mkdir -p /var/run/mysqld
chown -R mysql /var/run/mysqld
chown -R mysql /usr/local/mysql

echo "=========== Installing mysql clients 5.6 ==============="
apt-get install mysql-client-5.6
