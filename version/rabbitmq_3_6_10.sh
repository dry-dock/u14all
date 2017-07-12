#!/bin/bash -e

echo "================= Installing RabbitMQ PreReqs ==================="
sudo apt-get install -y erlang
sudo apt-get install erlang-nox
sudo apt-get install socat
sudo apt-get install logrotate
echo "================= Installing RabbitMQ 3.6.10 ==================="
sudo wget https://www.rabbitmq.com/releases/rabbitmq-server/v3.6.10/rabbitmq-server_3.6.10-1_all.deb
sudo dpkg -i rabbitmq-server_3.6.10-1_all.deb
sudo rm -f rabbitmq-server_3.6.10-1_all.deb
