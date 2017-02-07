#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_REDIS_PORT=6379;
export SHIPPABLE_REDIS_BINARY="/usr/bin/redis-server";
export SHIPPABLE_REDIS_CMD="$SHIPPABLE_REDIS_BINARY";
# End service ENV variables
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
if [ $1 = "start" ]
then
  echo "================= Starting redismq ==================="
  printf "\n"
  start_generic_service "redis" "$SHIPPABLE_REDIS_BINARY" "$SHIPPABLE_REDIS_CMD" "$SHIPPABLE_REDIS_PORT";
elif [ $1 = "stop" ]
then
  echo "================= Stopping reddismq ==================="
  printf "\n"
  su -c "redis-cli shutdown";
else
  echo "No action executed"
fi
