#!/bin/bash -e
#
# Function to START
#
start_service() {
  start_generic_service "riak" "/usr/sbin/riak" "/usr/sbin/riak start" "8098";
}

#
# Function to STOP
#
stop_service() {
  riak stop;
}

source /u14all/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting riak ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping riak ==================="
printf "\n"
stop_service
printf "\n\n"
