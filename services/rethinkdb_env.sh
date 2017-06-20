#!/bin/bash -e
# Begin service ENV variables

if [ -z "$SHIPPABLE_RETHINKDB_PORT" ]; then
  export SHIPPABLE_RETHINKDB_PORT=28015;
fi

if [ -z "$SHIPPABLE_RETHINKDB_BINARY" ]; then
  export SHIPPABLE_RETHINKDB_BINARY="/usr/bin/rethinkdb";
fi

if [ -z "$SHIPPABLE_RETHINKDB_CMD" ]; then
  export SHIPPABLE_RETHINKDB_CMD="($SHIPPABLE_RETHINKDB_BINARY create -d /tmp/100 && $SHIPPABLE_RETHINKDB_BINARY serve -d /tmp/100)";
fi

if [ -z "$SHIPPABLE_RETHINKDB_LOG" ]; then
  export SHIPPABLE_RETHINKDB_LOG="/var/log/rethinkdb_data/log_file"
fi

# End service ENV variables
