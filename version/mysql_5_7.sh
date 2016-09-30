#!/bin/bash -e

echo "================= setting MySQL preReqs ==================="
sudo groupadd mysql
sudo useradd -g mysql mysql
apt-get install libaio1
mkdir -p /etc/mysql
mkdir /var/log/mysql

echo "=========== Downloading mysql 5.7.15 ==============="
apt-get install software-properties-common
add-apt-repository -y ppa:ondrej/mysql-5.7
apt-get update
apt-get install mysql-server

echo "=========== Installing mysql clients 5.7 ==============="
apt-get install mysql-client-5.7
