#!/bin/bash -e
# Begin service ENV variables

if [ -z "$SHIPPABLE_START_POSTGRES" ]; then
  export SHIPPABLE_START_POSTGRES=true;
fi

if [ -z "$SHIPPABLE_POSTGRES_PORT" ]; then
  export SHIPPABLE_POSTGRES_PORT=5432;
fi

if [ -z "$SHIPPABLE_POSTGRES_VERSION" ]; then
  export SHIPPABLE_POSTGRES_VERSION="9.6";
fi

if [ -z "$SHIPPABLE_POSTGRES_BINARY" ]; then
  export SHIPPABLE_POSTGRES_BINARY="/usr/lib/postgresql/$SHIPPABLE_POSTGRES_VERSION/bin/postgres";
fi

if [ -z "$SHIPPABLE_POSTGRES_CMD" ]; then
  export SHIPPABLE_POSTGRES_CMD="sudo -u postgres $SHIPPABLE_POSTGRES_BINARY -c config_file=/etc/postgresql/$SHIPPABLE_POSTGRES_VERSION/main/postgresql.conf";
fi

# End service ENV variables
