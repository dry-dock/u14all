#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_START_POSTGRES=true;
export SHIPPABLE_POSTGRES_PORT=5432;
export SHIPPABLE_POSTGRES_VERSION="9.4";
export SHIPPABLE_POSTGRES_BINARY="/usr/lib/postgresql/$SHIPPABLE_POSTGRES_VERSION/bin/postgres";
export SHIPPABLE_POSTGRES_CMD="sudo -u postgres $SHIPPABLE_POSTGRES_BINARY -c config_file=/etc/postgresql/$SHIPPABLE_POSTGRES_VERSION/main/postgresql.conf";

# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "postgres" "$SHIPPABLE_POSTGRES_BINARY" "$SHIPPABLE_POSTGRES_CMD" "$SHIPPABLE_POSTGRES_PORT";
}

#
# Function to STOP
#
stop_service() {
  sleep 30
  sudo kill -9 $(pgrep -f postgresql)
}

source /u14all/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting postgres ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping postgres ==================="
printf "\n"
stop_service
printf "\n\n"
