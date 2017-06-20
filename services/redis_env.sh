#!/bin/bash -e
# Begin service ENV variables

if [ -z "$SHIPPABLE_REDIS_PORT" ]; then
  export SHIPPABLE_REDIS_PORT=6379;
fi

if [ -z "$SHIPPABLE_REDIS_BINARY" ]; then
  export SHIPPABLE_REDIS_BINARY="/usr/bin/redis-server";
fi

if [ -z "$SHIPPABLE_REDIS_CMD" ]; then
  export SHIPPABLE_REDIS_CMD="$SHIPPABLE_REDIS_BINARY";
fi

# End service ENV variables
