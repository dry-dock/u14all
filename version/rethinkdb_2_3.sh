#!/bin/bash -e

echo "================= Installing RethinkDB ==================="

# Install the dependencies
sudo apt-get install -y \
  m4 \
  build-essential \
  protobuf-compiler \
  python \
  libprotobuf-dev \
  libcurl4-openssl-dev \
  libboost-all-dev \
  libncurses5-dev \
  libjemalloc-dev

# Install RethinkDB
wget http://download.rethinkdb.com/apt/pool/trusty/main/r/rethinkdb/rethinkdb_2.3.5~0trusty_amd64.deb
sudo dpkg -i rethinkdb*.deb
rm rethinkdb*.deb
# Start the service
# rethinkdb
