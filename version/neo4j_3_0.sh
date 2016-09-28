#!/bin/bash -e

VERSION=3.0.1

# Make sure Java is installed
java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
if [[ -z "$java_version" ]]; then
  echo "ElasticSearch needs Java to be installed on your system. Exiting."
  exit 1
fi

# Install prerequisites
sudo apt-get install -y lsof

# Install Neo4j
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' >/tmp/neo4j.list
sudo mv /tmp/neo4j.list /etc/apt/sources.list.d
sudo apt-get update
sudo apt-get install neo4j=${VERSION}
