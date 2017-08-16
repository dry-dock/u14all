#!/bin/bash -e

echo "================= Installing Riak ==================="

apt-get update
# Install dependencies
sudo apt-get install -y \
  m4 \
  build-essential \
  protobuf-compiler \
  python \
  libprotobuf8 \
  libcurl4-openssl-dev \
  libboost-all-dev \
  libncurses5-dev \
  libjemalloc-dev
#install Riak
curl -s https://packagecloud.io/install/repositories/basho/riak/script.deb.sh | sudo bash
apt-get install riak=2.2.3-1

