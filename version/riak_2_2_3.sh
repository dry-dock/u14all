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
wget http://s3.amazonaws.com/downloads.basho.com/riak/2.2/2.2.3/ubuntu/trusty/riak_2.2.3-1_amd64.deb
sudo dpkg -i riak*.deb
rm riak*.deb
