#!/bin/bash


set -e

# ensure elasticsearch user exists
useradd elastisearch
groupadd elasticsearch
useradd -g elasticsearch elasticsearch

# grab gosu for easy step-down from root
GOSU_VERSION=1.7
wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)"
wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc"
export GNUPGHOME="$(mktemp -d)"
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu
rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc
chmod +x /usr/local/bin/gosu
gosu nobody true

ELASTICSEARCH_VERSION=5.1.2
#setup elasticsearch
cd /usr/local/

echo "================= Installing ElasticSearch 5.1.2 ==================="
sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz
sudo tar xzf elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz -C /usr/local && sudo rm -f elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz
sudo mv elasticsearch-${ELASTICSEARCH_VERSION} elasticsearch
sudo ln -s /usr/local/elasticsearch/bin/elasticsearch /usr/local/bin/elasticsearch

#PATH=/usr/local/elasticsearch/bin:$PATH

mkdir -p /usr/local/elasticsearch/logs
mkdir -p /usr/local/elasticsearch/tmp

cd /usr/local/elasticsearch
cp -r /u14all/version/elasticsearch/config /usr/local/elasticsearch/config

for path in \
	./tmp \
	./data \
	./logs \
	./config \
	./config/scripts \
; do \
	mkdir -p "$path";
	chown -R elasticsearch:elasticsearch "$path";
done



# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
# Change the ownership of user-mutable directories to elasticsearch
for path in \
	/usr/local/elasticsearch/data \
	/usr/local/elasticsearch/logs \
; do
	chown -R elasticsearch:elasticsearch "$path"
done
