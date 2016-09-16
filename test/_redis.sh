#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_REDIS_PORT=6379;
export SHIPPABLE_REDIS_BINARY="/usr/bin/redis-server";
export SHIPPABLE_REDIS_CMD="$SHIPPABLE_REDIS_BINARY";
# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "redis" "$SHIPPABLE_REDIS_BINARY" "$SHIPPABLE_REDIS_CMD" "$SHIPPABLE_REDIS_PORT";
}

#
# Function to STOP
#
stop_service() {
  sudo su -c "redis-cli shutdown";
}

source /u14pls/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting redis ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping redis ==================="
printf "\n"
stop_service
printf "\n\n"
