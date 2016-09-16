#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_RABBITMQ_PORT=5672;
export SHIPPABLE_RABBITMQ_BINARY="/usr/sbin/rabbitmq-server";
export SHIPPABLE_RABBITMQ_CMD="$SHIPPABLE_RABBITMQ_BINARY";
# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "rabbitmq" "$SHIPPABLE_RABBITMQ_BINARY" "$SHIPPABLE_RABBITMQ_CMD" "$SHIPPABLE_RABBITMQ_PORT";
}

#
# Function to STOP
#
stop_service() {
  true;
}

source /u14pls/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting rabbitmq ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping rabbitmq ==================="
printf "\n"
stop_service
printf "\n\n"
