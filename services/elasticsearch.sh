#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_ES_CLUSTER_NAME=shippabletest;
export SHIPPABLE_ES_PORT=9200;
export SHIPPABLE_ES_BINARY="/usr/local/bin/elasticsearch";
export SHIPPABLE_ES_TMP=/usr/local/elasticsearch/tmp
export SHIPPABLE_ES_CMD="ES_JAVA_OPTS=\"-Djna.tmpdir=$SHIPPABLE_ES_TMP -Djava.io.tmpdir=$SHIPPABLE_ES_TMP\" $SHIPPABLE_ES_BINARY -Ecluster.name=$SHIPPABLE_ES_CLUSTER_NAME";
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
  echo "================= Starting Elasticsearch ==================="
  printf "\n"
  start_generic_service "elasticsearch" "$SHIPPABLE_ES_BINARY" "$SHIPPABLE_ES_CMD" "$SHIPPABLE_ES_PORT";
elif [ "$service_cmd" = 'stop' ]
then
  echo "================= Stopping Elasticsearch ==================="
  printf "\n"
  # This script is also called elasticsearch. We need to make sure we don't kill
  # ourselves
  kill -9 $(ps aux | grep elasticsearch | grep -v shippable_service | awk '{print $2}')
else
  echo "Failed to execute the action"
fi
