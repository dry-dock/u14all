#!/bin/bash -e

VERSION=2.3.0
echo "================= Installing CouchDB $VERSION ==================="

# Install CouchDB
sudo apt-get install software-properties-common -y
echo "deb https://apache.bintray.com/couchdb-deb `lsb_release -cs` main" \
    | sudo tee -a /etc/apt/sources.list
curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc \
    | sudo apt-key add -
sudo apt-get update
sudo apt-get remove couchdb couchdb-bin couchdb-common -yf

echo "couchdb couchdb/mode select none" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes couchdb="$VERSION"*
