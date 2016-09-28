#!/bin/bash -e
sudo chmod 1777 /tmp

for file in /u14all/version/*;
do
  . $file
done

cd /u14all && cp -rf neo4j-server.properties /var/lib/neo4j/conf/

echo "================= Adding mysql cnf ==================="
cd /u14all && cp -rf my.cnf /etc/mysql/my.cnf

echo "================= Adding PostgreSQL cnf ==================="
cd /u14all && cp -rf pg_hba.cnf /etc/postgresql/9.6/main/pg_hba.conf

echo "================= Cleaning package lists ==================="
apt-get clean
apt-get autoclean
apt-get autoremove
