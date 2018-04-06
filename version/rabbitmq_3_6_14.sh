
echo "================= Installing RabbitMQ PreReqs ==================="
sudo apt-get install -q -y erlang erlang-nox socat logrotate

RABBITMQ_VER=3.6.15
echo "================= Installing RabbitMQ $RABBITMQ_VER ==================="
RABBITMQ_DEB="rabbitmq-server_$RABBITMQ_VER-1_all.deb"
sudo wget https://www.rabbitmq.com/releases/rabbitmq-server/v"$RABBITMQ_VER"/"$RABBITMQ_DEB"
sudo dpkg -i "$RABBITMQ_DEB"
sudo rm -f "$RABBITMQ_DEB"
