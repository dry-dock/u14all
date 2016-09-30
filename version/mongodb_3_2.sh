#!/bin/bash -e

echo "================= Installing Mongodb 3.2 ==================="
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y \
  mongodb-org=3.2.9 \
  mongodb-org-server=3.2.9 \
  mongodb-org-shell=3.2.9 \
  mongodb-org-mongos=3.2.9 \
  mongodb-org-tools=3.2.9

# Create the data directory
sudo mkdir -p /data/db

# Pin the current version
sudo echo "mongodb-org hold" | sudo dpkg --set-selections
sudo echo "mongodb-org-server hold" | sudo dpkg --set-selections
sudo echo "mongodb-org-shell hold" | sudo dpkg --set-selections
sudo echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
sudo echo "mongodb-org-tools hold" | sudo dpkg --set-selections
