#!/bin/bash -e

# Install Cassandra 2.1
sudo echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
sudo curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y dsc21=2.1.4-1 cassandra=2.1.4
