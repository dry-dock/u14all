# Begin service ENV variables
export SHIPPABLE_CASSANDRA_PORT=9160;
export SHIPPABLE_CASSANDRA_BINARY="/usr/sbin/cassandra";
export SHIPPABLE_MYSQL_CMD="$SHIPPABLE_MYSQL_BINARY -f -R";
export SHIPPABLE_CASSANDRA_LOG="/var/log/cassandra/system.log"

# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "cassandra" "$SHIPPABLE_CASSANDRA_BINARY" "$SHIPPABLE_CASSANDRA_CMD" "$SHIPPABLE_CASSANDRA_PORT" "$SHIPPABLE_CASSANDRA_LOG";
}

#
# Function to STOP
#
stop_service() {
  sudo su -c "kill -9 `ps aux | grep [c]assandra | awk '{print $2}'`";
}

echo "================= Starting cassandra ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping cassandra ==================="
printf "\n"
stop_service
printf "\n\n"
