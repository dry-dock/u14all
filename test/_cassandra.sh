#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_CASSANDRA_PORT=9042;
export SHIPPABLE_CASSANDRA_BINARY="/usr/sbin/cassandra";
export SHIPPABLE_MYSQL_CMD="$SHIPPABLE_MYSQL_BINARY -f -R";
export SHIPPABLE_CASSANDRA_LOG="/var/log/cassandra/system.log"
# End service ENV variables

#
# Function to START
#
start_service() {
  sudo su -c "/usr/sbin/cassandra -R"
}

#
# Function to STOP
#
stop_service() {
  sudo su -c "kill -9 `ps aux | grep [c]assandra | awk '{print $2}'`";
}

source /u14all/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting cassandra ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping cassandra ==================="
printf "\n"
stop_service
printf "\n\n"
