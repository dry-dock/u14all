#!/bin/bash -e
# Begin service ENV variables
if [ -z "$SHIPPABLE_COUCHDB_PORT" ]; then
  export SHIPPABLE_COUCHDB_PORT=5984;
fi

if [ -z "$SHIPPABLE_COUCHDB_BINARY" ]; then
  export SHIPPABLE_COUCHDB_BINARY="/opt/couchdb/bin/couchdb";
fi

if [ -z "$SHIPPABLE_COUCHDB_CMD" ]; then
  export SHIPPABLE_COUCHDB_CMD="service couchdb";
fi

if [ -z "$SHIPPABLE_COUCHDB_LOG" ]; then
  export SHIPPABLE_COUCHDB_LOG="couchdb.stderr";
fi

# End service ENV variables
