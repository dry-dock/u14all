#!/bin/bash -e

VERSION=1.6.1

mkdir /usr/local/var/lib/couchdb

# Add couchdb user
sudo adduser \
  --system \
  --home /usr/local/var/lib/couchdb \
  --no-create-home \
  --shell /bin/bash \
  --group --gecos \
  "CouchDB Administrator" couchdb

# Install prerequisites
sudo apt-get install -y \
  build-essential \
  erlang-base-hipe \
  erlang-dev \
  erlang-manpages \
  erlang-eunit \
  erlang-nox \
  libicu-dev \
  libmozjs185-dev \
  libcurl4-openssl-dev

# Install CouchDB
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:couchdb/stable -y
sudo apt-get update
sudo apt-get remove couchdb couchdb-bin couchdb-common -yf
sudo apt-get install couchdb -y

# Postinstallation setup
sudo stop couchdb
sudo chown -R couchdb:couchdb /usr/lib/couchdb /usr/share/couchdb /etc/couchdb /usr/bin/couchdb
sudo chmod -R 0770 /usr/lib/couchdb /usr/share/couchdb /etc/couchdb /usr/bin/couchdb

# Start couchdb service
mkdir /var/run/couchdb
touch /var/run/couchdb/couch.uri
# Check if couchdb is running
# curl http://localhost:5984
