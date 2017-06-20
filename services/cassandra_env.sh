#!/bin/bash -e
# Begin service ENV variables
if [ -z "$SHIPPABLE_CASSANDRA_PORT" ]; then
  export SHIPPABLE_CASSANDRA_PORT=9042;
fi

if [ -z "$SHIPPABLE_CASSANDRA_BINARY" ]; then
  export SHIPPABLE_CASSANDRA_BINARY="/usr/sbin/cassandra";
fi

if [ -z "$SHIPPABLE_CASSANDRA_CMD" ]; then
  export SHIPPABLE_CASSANDRA_CMD="$SHIPPABLE_CASSANDRA_BINARY -R";
fi

if [ -z "$SHIPPABLE_CASSANDRA_LOG" ]; then
  export SHIPPABLE_CASSANDRA_LOG="/var/log/cassandra/system.log"
fi

# End service ENV variables
