#!/bin/bash -e
# Begin service ENV variables
source "$(dirname "$0")/neo4j_env.sh"

# End service ENV variables

start_generic_service() {
  name=$1
  binary=$2
  service_cmd=$3
  service_port=$4


  if [ -f "$binary" ]; then
    sudo su -c "$service_cmd start > /dev/null 2>&1 &";
    sleep 5

    ## check if the service port is reachable
    while ! nc -vz localhost "$service_port" &>/dev/null; do

      ## check service process PID
      service_proc=$(pgrep -f "$name" || echo "")

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
if [ "$1" = "start" ]
then
  echo "================= Starting neo4j ==================="
  printf "\n"
  start_generic_service "neo4j" "$SHIPPABLE_NEO4J_BINARY" "$SHIPPABLE_NEO4J_CMD" "$SHIPPABLE_NEO4J_PORT" "$SHIPPABLE_NEO4J_LOG";

elif [ "$1" = "stop" ]
then
  echo "================= Stopping neo4j ==================="
  printf "\n"
 su -c "$SHIPPABLE_NEO4J_CMD stop 2>&1 > /dev/null &";
else
  echo "No action executed"
fi
