#!/bin/bash


set -e

# ensure elasticsearch user exists
useradd elasticsearch

# grab gosu for easy step-down from root
GOSU_VERSION=1.7
wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)"
wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc"
export GNUPGHOME="$(mktemp -d)"
gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu
rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc
chmod +x /usr/local/bin/gosu
gosu nobody true

ELASTICSEARCH_VERSION=5.5.1
#setup elasticsearch
cd /usr/local/

echo "================= Installing ElasticSearch $ELASTICSEARCH_VERSION ==================="
sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz
sudo tar xzf elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz -C /usr/local && sudo rm -f elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz
sudo mv elasticsearch-${ELASTICSEARCH_VERSION} elasticsearch
cp /u14all/version/elasticsearch_utils/elasticsearch /usr/local/bin/

#PATH=/usr/local/elasticsearch/bin:$PATH

mkdir -p /usr/local/elasticsearch/logs
mkdir -p /usr/local/elasticsearch/tmp

cd /usr/local/elasticsearch
cp -r /u14all/version/elasticsearch_utils/config /usr/local/elasticsearch/config
for path in \
	./tmp \
	./data \
	./logs \
	./config \
	./config/scripts \
; do \
	mkdir -p "$path";
	chown -R elasticsearch "$path";
done



# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
# Change the ownership of user-mutable directories to elasticsearch
for path in \
	/usr/local/elasticsearch/data \
	/usr/local/elasticsearch/logs \
; do
	chown -R elasticsearch "$path"
done
