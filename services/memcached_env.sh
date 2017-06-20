#!/bin/bash -e
# Begin service ENV variables

if [ -z "$SHIPPABLE_MEMCACHED_PORT" ]; then
  export SHIPPABLE_MEMCACHED_PORT=11211;
fi

if [ -z "$SHIPPABLE_MEMCACHED_BINARY" ]; then
  export SHIPPABLE_MEMCACHED_BINARY="/usr/local/bin/memcached";
fi

if [ -z "$SHIPPABLE_MEMCACHED_CMD" ]; then
  export SHIPPABLE_MEMCACHED_CMD="$SHIPPABLE_MEMCACHED_BINARY -d -u nobody -l 127.0.0.1 -p $SHIPPABLE_MEMCACHED_PORT";
fi

# End service ENV variables
