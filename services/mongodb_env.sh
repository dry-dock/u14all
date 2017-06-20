#!/bin/bash -e
# Begin service ENV variables

if [ -z "$SHIPPABLE_MONGODB_PORT" ]; then
  export SHIPPABLE_MONGODB_PORT=27017;
fi

if [ -z "$SHIPPABLE_MONGODB_BINARY" ]; then
  export SHIPPABLE_MONGODB_BINARY="/usr/bin/mongod";
fi

if [ -z "$SHIPPABLE_MONGODB_CMD" ]; then
  export SHIPPABLE_MONGODB_CMD="$SHIPPABLE_MONGODB_BINARY -f /etc/mongod.conf --smallfiles";
fi

# End service ENV variables
