#!/bin/bash -e
# Begin service ENV variables

if [ -z "$SHIPPABLE_SELENIUM_BINARY" ]; then
  export SHIPPABLE_SELENIUM_BINARY="/usr/local/selenium/selenium-server-standalone-3.141.59.jar";
fi

if [ -z "$SHIPPABLE_SELENIUM_PORT" ]; then
  export SHIPPABLE_SELENIUM_PORT=4444;
fi

if [ -z "$SHIPPABLE_SELENIUM_CMD" ]; then
  export SHIPPABLE_SELENIUM_CMD="java -Djava.security.egd=file:///dev/urandom -jar $SHIPPABLE_SELENIUM_BINARY -port $SHIPPABLE_SELENIUM_PORT > /dev/null 2>&1 &";
fi

# End service ENV variables
