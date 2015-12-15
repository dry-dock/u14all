#!/bin/bash -e

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
wget http://download.rethinkdb.com/apt/pool/precise/main/r/rethinkdb/rethinkdb_2.0.1~0precise_amd64.deb
sudo dpkg -i rethinkdb*.deb
rm rethinkdb*.deb
# Start the service
# rethinkdb
