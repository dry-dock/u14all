#!/bin/bash -e
# Begin service ENV variables
if [ -z "$SHIPPABLE_ES_CLUSTER_NAME" ]; then
  export SHIPPABLE_ES_CLUSTER_NAME="shippabletest";
fi

if [ -z "$SHIPPABLE_ES_PORT" ]; then
  export SHIPPABLE_ES_PORT=9200;
fi

if [ -z "$SHIPPABLE_ES_BINARY" ]; then
  export SHIPPABLE_ES_BINARY="/usr/local/bin/elasticsearch";
fi

if [ -z "$SHIPPABLE_ES_TMP" ]; then
  export SHIPPABLE_ES_TMP="/usr/local/elasticsearch/tmp"
fi

if [ -z "$SHIPPABLE_ES_CMD" ]; then
  export SHIPPABLE_ES_CMD="ES_JAVA_OPTS=\"-Djna.tmpdir=$SHIPPABLE_ES_TMP -Djava.io.tmpdir=$SHIPPABLE_ES_TMP\" $SHIPPABLE_ES_BINARY -Ecluster.name=$SHIPPABLE_ES_CLUSTER_NAME";
fi

# End service ENV variables
