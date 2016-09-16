#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_MONGODB_PORT=27017;
export SHIPPABLE_MONGODB_BINARY="/usr/bin/mongod";
export SHIPPABLE_MONGODB_CMD="$SHIPPABLE_MONGODB_BINARY -f /etc/mongod.conf --smallfiles";
# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "mongodb" "$SHIPPABLE_MONGODB_BINARY" "$SHIPPABLE_MONGODB_CMD" "$SHIPPABLE_MONGODB_PORT";
}

#
# Function to STOP
#
stop_service() {
  sudo su -c "/usr/bin/mongod -f /etc/mongod.conf --shutdown";
  sudo su -c "rm -rf /var/lib/mongodb/*";
}

source /u14pls/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting mongo ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping mongo ==================="
printf "\n"
stop_service
printf "\n\n"
