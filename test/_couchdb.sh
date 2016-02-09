#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_COUCHDB_PORT=5984;
export SHIPPABLE_COUCHDB_BINARY="/usr/bin/couchdb";
export SHIPPABLE_COUCHDB_CMD="$SHIPPABLE_COUCHDB_BINARY -b";
export SHIPPABLE_COUCHDB_LOG="couchdb.stderr"
# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "couchdb" "$SHIPPABLE_COUCHDB_BINARY" "$SHIPPABLE_COUCHDB_CMD" "$SHIPPABLE_COUCHDB_PORT" "$SHIPPABLE_COUCHDB_LOG";
}

#
# Function to STOP
#
stop_service() {
  sudo su -c "$SHIPPABLE_COUCHDB_BINARY -d";
}

source /u14all/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting couchdb ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping couchdb ==================="
printf "\n"
stop_service
printf "\n\n"
