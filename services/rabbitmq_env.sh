#!/bin/bash -e
# Begin service ENV variables

if [ -z "$SHIPPABLE_RABBITMQ_PORT" ]; then
  export SHIPPABLE_RABBITMQ_PORT=5672;
fi

if [ -z "$SHIPPABLE_RABBITMQ_BINARY" ]; then
  export SHIPPABLE_RABBITMQ_BINARY="/usr/sbin/rabbitmq-server";
fi

if [ -z "$SHIPPABLE_RABBITMQ_CMD" ]; then
  export SHIPPABLE_RABBITMQ_CMD="$SHIPPABLE_RABBITMQ_BINARY";
fi

# End service ENV variables
