#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_START_MYSQL=true;
export SHIPPABLE_MYSQL_PORT=3306;
export SHIPPABLE_MYSQL_BINARY="/usr/bin/mysqld_safe";
export SHIPPABLE_MYSQL_CMD="$SHIPPABLE_MYSQL_BINARY";
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
  fi
}

if [ $1 = 'start' ]
then
  echo "================= Starting mysql ==================="
  printf "\n"
  start_generic_service "mysql" "$SHIPPABLE_MYSQL_BINARY" "$SHIPPABLE_MYSQL_CMD" "$SHIPPABLE_MYSQL_PORT";
  printf "\n\n"
elif [ $1 = 'stop' ]
then
  echo "================= Stopping mysql ==================="
  printf "\n"
  sleep 10
  sudo kill -9 $(pgrep -f mysql)
  printf "\n\n"
else
  echo "Failed to execute the action"
fi
