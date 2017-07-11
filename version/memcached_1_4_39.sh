#!/bin/bash -e

MEM_VERSION=1.4.39
LIB_VERSION=1.0.18

echo "================= Installing MemCached Prereqs ==================="
apt-get install -y libevent-dev libsasl2-dev

# Add memcache user to run the daemon later
groupadd -r memcache
useradd -r -g memcache memcache

echo "================= Installing MemCached ==================="
wget http://memcached.org/files/memcached-$MEM_VERSION.tar.gz
tar xzf memcached-$MEM_VERSION.tar.gz && cd memcached-$MEM_VERSION
./configure
make && make install
cd .. && rm -rf memcached-$MEM_VERSION && rm -f memcached-$MEM_VERSION.tar.gz


echo "================= Installing LibMemCached ==================="
wget https://launchpad.net/libmemcached/1.0/$LIB_VERSION/+download/libmemcached-$LIB_VERSION.tar.gz
tar xzf libmemcached-$LIB_VERSION.tar.gz && cd libmemcached-$LIB_VERSION
./configure
make && make install
cd .. && rm -rf libmemcached-$LIB_VERSION && rm -f libmemcached-$LIB_VERSION.tar.gz
ldconfig
