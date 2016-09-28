#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_MEMCACHED_PORT=11211;
export SHIPPABLE_MEMCACHED_BINARY="/usr/local/bin/memcached";
export SHIPPABLE_MEMCACHED_CMD="$SHIPPABLE_MEMCACHED_BINARY -d -u nobody -l 127.0.0.1 -p $SHIPPABLE_MEMCACHED_PORT";
# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "memcache" "$SHIPPABLE_MEMCACHED_BINARY" "$SHIPPABLE_MEMCACHED_CMD" "$SHIPPABLE_MEMCACHED_PORT";
}

#
# Function to STOP
#
stop_service() {
  sudo su -c "killall memcached";
}

source /u14all/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting memcache ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping memcache ==================="
printf "\n"
stop_service
printf "\n\n"
