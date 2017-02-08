#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_COUCHDB_PORT=5984;
export SHIPPABLE_COUCHDB_BINARY="/usr/bin/couchdb";
export SHIPPABLE_COUCHDB_CMD="$SHIPPABLE_COUCHDB_BINARY -b";
export SHIPPABLE_COUCHDB_LOG="couchdb.stderr"
# End service ENV variables

service_cmd=$1
start_generic_service() {
  name=$1
  binary=$2
  service_cmd=$3
  service_port=$4


  if [ -f $binary ]; then
    sudo su -c "$service_cmd > /dev/null 2>&1 &";
    sleep 5

    ## check if the service port is reachable
    while ! nc -vz localhost $service_port &>/dev/null; do

      ## check service process PID
      service_proc=$(pgrep -f "$binary" || echo "")

      if [ ! -z "$service_proc" ]; then
        ## service PID exists, service is starting. Hence wait...
        echo "Waiting for $name to start...";
      else
        ## service PID does not exist, service crashed. Reboot service...
        echo "Service $name boot error, restarting..."
        sudo su -c "$service_cmd > /dev/null 2>&1 &";
      fi
      sleep 5;
    done
    echo "$name started successfully";
  else
    echo "$name will not be started because the binary was not found at $binary."
    exit 99 
 fi
}

if [ $service_cmd = 'start' ]
then
  echo "================= Starting Couchdb ==================="
  printf "\n"
  start_generic_service "couchdb" "$SHIPPABLE_COUCHDB_BINARY" "$SHIPPABLE_COUCHDB_CMD" "$SHIPPABLE_COUCHDB_PORT" "$SHIPPABLE_COUCHDB_LOG";
  printf "\n\n"
elif [ $service_cmd = 'stop' ]
then
  echo "================= Stopping Couchdb ==================="
  printf "\n"
  su -c "$SHIPPABLE_COUCHDB_BINARY -d";
  printf "\n\n"
else
  echo "Failed to execute the action"
fi
