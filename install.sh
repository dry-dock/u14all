#!/bin/bash -e

export DEBIAN_FRONTEND=noninteractive
sudo chmod 1777 /tmp

for file in /u14all/version/*.sh;
do
  . $file
done

mkdir -p /var/lib/neo4j/conf
cd /u14all && cp -rf neo4j-server.properties /var/lib/neo4j/conf/

echo "================= Adding mysql cnf ==================="
cd /u14all && cp -rf my.cnf /etc/mysql/my.cnf

POSTGRES_VERSION=10
echo "================= Adding PostgreSQL cnf ==================="
cd /u14all && cp -rf pg_hba.cnf /etc/postgresql/"$POSTGRES_VERSION"/main/pg_hba.conf

echo "================= Adding shippable_service ==================="
mkdir -p /usr/local/bin/shippable_services
cp /u14all/services/* /usr/local/bin/shippable_services
mv /usr/local/bin/shippable_services/shippable_service /usr/local/bin/shippable_service

echo "================= Adding packages for shippable_service =================="
apt install -y netcat
echo "================= Adding pycrypto ============"
pip install pycrypto

echo "================= Cleaning package lists ==================="
apt-get clean
apt-get autoclean
apt-get autoremove

