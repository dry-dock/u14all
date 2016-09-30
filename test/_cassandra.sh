# Begin service ENV variables
export SHIPPABLE_CASSANDRA_PORT=9160;
export SHIPPABLE_CASSANDRA_BINARY="/usr/sbin/cassandra";
if [ -z "$SHIPPABLE_CASSANDRA_CMD" ]; then
  export SHIPPABLE_CASSANDRA_CMD="$SHIPPABLE_CASSANDRA_BINARY -f -R";
fi
export SHIPPABLE_CASSANDRA_LOG="/var/log/cassandra/system.log"

# End service ENV variables

#
# Function to START <%=obj%>
#
<%=obj%>_start() {
  start_generic_service "cassandra" "$SHIPPABLE_CASSANDRA_BINARY" "$SHIPPABLE_CASSANDRA_CMD" "$SHIPPABLE_CASSANDRA_PORT" "$SHIPPABLE_CASSANDRA_LOG";
}

#
# Function to STOP <%=obj%>
#
<%=obj%>_stop() {
  sudo su -c "kill -9 `ps aux | grep [c]assandra | awk '{print $2}'`";
}

#
# Call to start <%=obj%>
#
trap before_exit EXIT
exec_grp "<%=obj%>_start"
