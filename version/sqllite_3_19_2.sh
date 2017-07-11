#!/bin/bash -e

echo "================= Installing SQLLite 3.19.2 ==================="
sudo add-apt-repository ppa:jonathonf/backports

sudo apt-get update && sudo apt-get install sqlite3
