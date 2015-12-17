#!/bin/bash -e

for file in /u14all/version/*;
do
  . $file
done

cd /u14all && cp -rf neo4j-server.properties /var/lib/neo4j/conf/

apt-get clean
apt-get autoclean
apt-get autoremove
