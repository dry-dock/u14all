#!/bin/bash -e

echo "================= Installing RabbitMQ PreReqs ==================="
sudo apt-get install -y erlang
sudo apt-get install erlang-nox

echo "================= Installing RabbitMQ 3.5 ==================="
sudo wget https://www.rabbitmq.com/releases/rabbitmq-server/v3.5.1/rabbitmq-server_3.5.1-1_all.deb
sudo dpkg -i rabbitmq-server_3.5.1-1_all.deb
sudo rm -f rabbitmq-server_3.5.1-1_all.deb
