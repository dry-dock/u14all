#!/bin/bash -e

echo "================= setting MySQL preReqs ==================="
sudo groupadd mysql
sudo useradd -g mysql mysql
apt-get install libaio1
mkdir -p /etc/mysql
mkdir /var/log/mysql

echo "=========== Downloading mysql 5.6 ==============="
cd /usr/local
wget -O mysql-5.6.33-linux-glibc2.5-x86_64.tar.gz http://dev.mysql.com/Downloads/MySQL-5.6/mysql-5.6.33-linux-glibc2.5-x86_64.tar.gz
tar xvfz mysql-5.6.33-linux-glibc2.5-x86_64.tar.gz
mv mysql-5.6.33-linux-glibc2.5-x86_64 mysql
rm mysql-5.6.33-linux-glibc2.5-x86_64.tar.gz
cd mysql
chown -R mysql .
chgrp -R mysql .

echo "================= Configuring MySQL ==================="
scripts/mysql_install_db --user=mysql
chown -R root .
chown -R mysql data
cp support-files/mysql.server /etc/init.d/mysql.server

# fixes support issue https://github.com/Shippable/support/issues/3736
ln -s /var/run/mysqld/mysqld.sock /tmp/mysql.sock

echo "=========== Installing mysql clients 5.6 ==============="
apt-get update
apt-get install mysql-client-5.6

ln -sf /usr/local/mysql/bin/mysqld_safe /usr/bin/mysqld_safe
