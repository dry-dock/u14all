
#!/bin/bash -e

sudo apt-get install -y wget ca-certificates

POSTGRES_VERSION=11
echo "================= Installing Postgres $POSTGRES_VERSION ==================="
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-"$POSTGRES_VERSION" postgresql-server-dev-"$POSTGRES_VERSION"
sudo apt-get install postgis


mkdir /etc/ssl/private-copy
mv /etc/ssl/private/* /etc/ssl/private-copy/
rm -r /etc/ssl/private
mv /etc/ssl/private-copy /etc/ssl/private
chmod -R 0700 /etc/ssl/private
chown -R postgres /etc/ssl/private
