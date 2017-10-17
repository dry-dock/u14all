#!/bin/bash -e

NEO4J_VERSION=3.2.6
echo "=========== Installing neo4j $NEO4J_VERSION ============="

# Install prerequisites
sudo apt-get install -y lsof

# Install Neo4j
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' >/tmp/neo4j.list
sudo mv /tmp/neo4j.list /etc/apt/sources.list.d
sudo apt-get update
sudo apt-get install neo4j=${NEO4J_VERSION}
