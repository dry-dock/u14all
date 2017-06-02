#!/bin/bash -e
# Begin service ENV variables
if [ -z "$SHIPPABLE_SELENIUM_BINARY" ]; then
	export SHIPPABLE_SELENIUM_BINARY="/usr/local/selenium/selenium-server-standalone-3.4.0.jar";
fi
if [ -z "$SHIPPABLE_SELENIUM_PORT"]; then
	export SHIPPABLE_SELENIUM_PORT=4444;
fi
if [ -z "$SHIPPABLE_SELENIUM_CMD" ]; then
	export SHIPPABLE_SELENIUM_CMD="java -Djava.security.egd=file:///dev/urandom -jar $SHIPPABLE_SELENIUM_BINARY -port $SHIPPABLE_SELENIUM_PORT > /dev/null 2>&1 &";
fi

export DISPLAY=":99.0"
# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "selenium" "$SHIPPABLE_SELENIUM_BINARY" "$SHIPPABLE_SELENIUM_CMD" "$SHIPPABLE_SELENIUM_PORT";
}

#
# Function to STOP
#
stop_service() {
  sudo su -c "killall -15 java";
}

source /u14all/test/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting selenium ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping selenium ==================="
printf "\n"
stop_service
printf "\n\n"
