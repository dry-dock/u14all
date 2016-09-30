#!/bin/bash -e

echo "================= Installing Cassandra 3.6 ==================="
echo "deb http://www.apache.org/dist/cassandra/debian 36x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
gpg --keyserver pgp.mit.edu --recv-keys 749D6EEC0353B12C
gpg --export --armor 749D6EEC0353B12C | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install cassandra
