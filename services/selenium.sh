#!/bin/bash -e
# Begin service ENV variables
source "$(dirname "$0")/selenium_env.sh"
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

if [ "$service_cmd" = 'start' ]
then
  echo "================= Starting Selenium ==================="
  printf "\n"
  start_generic_service "selenium" "$SHIPPABLE_SELENIUM_BINARY" "$SHIPPABLE_SELENIUM_CMD" "$SHIPPABLE_SELENIUM_PORT";
  printf "\n\n"
elif [ "$service_cmd" = 'stop' ]
then
  echo "================= Stopping Selenium ==================="
  printf "\n"
  su -c "killall -15 java";
  printf "\n\n"
else
  echo "Failed to execute the action"
fi
