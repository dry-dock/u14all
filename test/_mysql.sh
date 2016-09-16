#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_START_MYSQL=true;
export SHIPPABLE_MYSQL_PORT=3306;
export SHIPPABLE_MYSQL_BINARY="/usr/bin/mysqld_safe";
export SHIPPABLE_MYSQL_CMD="$SHIPPABLE_MYSQL_BINARY";
# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "mysql" "$SHIPPABLE_MYSQL_BINARY" "$SHIPPABLE_MYSQL_CMD" "$SHIPPABLE_MYSQL_PORT";
}

#
# Function to STOP
#
stop_service() {
  mysqladmin shutdown
}

source /u14pls/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting mysql ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping mysql ==================="
printf "\n"
stop_service
printf "\n\n"
