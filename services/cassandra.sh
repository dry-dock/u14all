#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_CASSANDRA_PORT=9042;
export SHIPPABLE_CASSANDRA_BINARY="/usr/sbin/cassandra";
export SHIPPABLE_CASSANDRA_CMD="$SHIPPABLE_CASSANDRA_BINARY -R";
export SHIPPABLE_CASSANDRA_LOG="/var/log/cassandra/system.log"
# End service ENV variables
service_cmd=$1
start_generic_service() {
  name=$1
  binary=$2
  service_cmd=$3
  service_port=$4


  if [ -f "$binary" ]; then
    sudo su -c "$service_cmd > /dev/null 2>&1 &";
    sleep 5

    ## check if the service port is reachable
    while ! nc -vz localhost "$service_port" &>/dev/null; do

      ## check service process PID
      # cassandra is special because the binary we use to launch the server
      # isn't what actually ends up running later...
      service_proc=$(pgrep -f "cassandra" || echo "")

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

if [ "$service_cmd" = 'start' ]
then
  echo "================= Starting Cassandra ==================="
  printf "\n"
  start_generic_service "Cassandra" "$SHIPPABLE_CASSANDRA_BINARY" "$SHIPPABLE_CASSANDRA_CMD" "$SHIPPABLE_CASSANDRA_PORT"
  printf "\n\n"
elif [ "$service_cmd" = 'stop' ]
then
  echo "================= Stopping Cassandra ==================="
  printf "\n"
 (kill -9 `ps aux | grep [c]assandra | awk '{print $2}'`) &
  printf "\n\n"
else
  echo "Failed to execute the action"
fi
