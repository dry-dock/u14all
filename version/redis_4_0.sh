#!/bin/bash -e

echo "================= Installing redis-server ==================="

sudo add-apt-repository ppa:chris-lea/redis-server
sudo apt-get update
sudo wget https://redis.io/download
sudo apt-get install -q -y redis-server=4:4.0.9*
