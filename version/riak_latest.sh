#!/bin/bash -e

echo "================= Installing Riak ==================="

# Install dependencies
sudo apt-get install -y \
  build-essential \
  libc6-dev-i386 \
  libncurses5-dev \
  openssl \
  libssl-dev \
  fop \
  xsltproc \
  unixodbc-dev \
  libwxbase2.8 \
  libwxgtk2.8-dev \
  libqt4-opengl-dev \
  libpam-dev

# Install Riak
wget http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.7/ubuntu/trusty/riak_2.0.7-1_amd64.deb
sudo dpkg -i riak*.deb
rm riak*.deb
