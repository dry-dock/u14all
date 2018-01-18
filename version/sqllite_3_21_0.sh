#!/bin/bash -e

SQLITE_VERSION=3.21.0
echo "================= Installing SQLite $SQLITE_VERSION ==================="

sudo add-apt-repository ppa:jonathonf/backports
sudo apt-get update && sudo apt-get install sqlite3="$SQLITE_VERSION"*

pushd /tmp
  wget https://www.sqlite.org/2017/sqlite-tools-linux-x86-3210000.zip
  unzip -u sqlite-tools-linux-x86-3210000.zip
  cp -r sqlite-tools-linux-x86-3210000/. /usr/bin
  rm -rf sqlite-tools-linux-x86-3210000*
