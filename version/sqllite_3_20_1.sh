#!/bin/bash -e

echo "================= Installing SQLite 3.20.1 ==================="


sudo add-apt-repository ppa:jonathonf/backports

sudo apt-get update && sudo apt-get install sqlite3

pushd /tmp
  wget https://www.sqlite.org/2017/sqlite-tools-linux-x86-3200100.zip
  unzip -u sqlite-tools-linux-x86-3200100.zip
  cp -r sqlite-tools-linux-x86-3200100/. /usr/bin
  rm -rf sqlite-tools-linux-x86-3200100*
