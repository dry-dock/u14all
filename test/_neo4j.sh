#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_NEO4J_PORT=7474;
export SHIPPABLE_NEO4J_BINARY="/usr/bin/neo4j";
export SHIPPABLE_NEO4J_CMD="$SHIPPABLE_NEO4J_BINARY start";
export SHIPPABLE_NEO4J_LOG="/var/log/neo4j/neo4j.log"

# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "neo4j" "$SHIPPABLE_NEO4J_BINARY" "$SHIPPABLE_NEO4J_CMD" "$SHIPPABLE_NEO4J_PORT" "$SHIPPABLE_NEO4J_LOG";
}

#
# Function to STOP
#
stop_service() {
  sudo su -c "$SHIPPABLE_NEO4J_BINARY stop 2>&1 > /dev/null &";
}

source /u14all/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting neo4j ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping neo4j ==================="
printf "\n"
stop_service
printf "\n\n"
