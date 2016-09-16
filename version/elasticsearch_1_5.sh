#!/bin/bash -e

VERSION=1.5.1

echo "================= Installing ElasticSearch ==================="
sudo wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${VERSION}.tar.gz
sudo tar xzf elasticsearch-${VERSION}.tar.gz -C /usr/local && sudo rm -f elasticsearch-${VERSION}.tar.gz
sudo ln -s /usr/local/elasticsearch-${VERSION}/bin/elasticsearch /usr/local/bin/elasticsearch
