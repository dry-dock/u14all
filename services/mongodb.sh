#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_MONGODB_PORT=27017;
export SHIPPABLE_MONGODB_BINARY="/usr/bin/mongod";
export SHIPPABLE_MONGODB_CMD="$SHIPPABLE_MONGODB_BINARY -f /etc/mongod.conf --smallfiles";
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
if [ $1=="start" ]
then
  echo "================= Starting mongo ==================="
  printf "\n"
  start_generic_service "mongodb" "$SHIPPABLE_MONGODB_BINARY" "$SHIPPABLE_MONGODB_CMD" "$SHIPPABLE_MONGODB_PORT";
elif [ $2="sttop" ]
then
  echo "================= Stopping mongo ==================="
  printf "\n"
  sudo su -c "/usr/bin/mongod -f /etc/mongod.conf --shutdown";
  sudo su -c "rm -rf /var/lib/mongodb/*";
else
  echo "No action executed"
fi
