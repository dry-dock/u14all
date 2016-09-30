#!/bin/bash -e

echo "================= setting MySQL preReqs ==================="
sudo groupadd mysql
sudo useradd -g mysql mysql
apt-get install libaio1
mkdir -p /etc/mysql
mkdir /var/log/mysql

echo "=========== Downloading mysql 5.7.15 ==============="
cd /usr/local
wget -O mysql-5.7.15-linux-glibc2.5-x86_64.tar.gz http://cdn.mysql.com//Downloads/MySQL-5.7/mysql-5.7.15-linux-glibc2.5-x86_64.tar.gz
tar xvfz mysql-5.7.15-linux-glibc2.5-x86_64.tar.gz
mv mysql-5.7.15-linux-glibc2.5-x86_64 mysql
rm mysql-5.7.15-linux-glibc2.5-x86_64.tar.gz
cd mysql
mkdir mysql-files
chmod 750 mysql-files
chown -R mysql .
chgrp -R mysql .

echo "================= Configuring MySQL ==================="
bin/mysqld --initialize --user=mysql
bin/mysql_ssl_rsa_setup
chown -R root .
chown -R mysql data mysql-files
ln -sf /usr/local/mysql/bin/mysqld_safe /usr/bin/mysqld_safe

echo "=========== Installing mysql clients 5.7 ==============="
apt-get install mysql-client-5.7
