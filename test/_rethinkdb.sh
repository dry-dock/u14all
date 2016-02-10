#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_RETHINKDB_PORT=28015;
export SHIPPABLE_RETHINKDB_BINARY="/usr/bin/rethinkdb";
export SHIPPABLE_RETHINKDB_CMD="($SHIPPABLE_RETHINKDB_BINARY create -d /tmp/100 && $SHIPPABLE_RETHINKDB_BINARY serve -d /tmp/100)";
export SHIPPABLE_RETHINKDB_LOG="/var/log/rethinkdb_data/log_file"
# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "rethinkdb" "$SHIPPABLE_RETHINKDB_BINARY" "$SHIPPABLE_RETHINKDB_CMD" "$SHIPPABLE_RETHINKDB_PORT" "$SHIPPABLE_RETHINKDB_LOG";
}

#
# Function to STOP
#
stop_service() {
  sudo su -c "killall rethinkdb";
}

source /u14all/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting rethinkdb ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping rethinkdb ==================="
printf "\n"
stop_service
printf "\n\n"
