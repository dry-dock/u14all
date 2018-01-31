#!/bin/bash -e

SQLITE_VERSION=3.22.0
echo "================= Installing SQLite $SQLITE_VERSION ==================="

sudo add-apt-repository ppa:jonathonf/backports
sudo apt-get update && sudo apt-get install sqlite3="$SQLITE_VERSION"*

