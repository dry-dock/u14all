
#!/bin/bash -e

declare -a services=( 'cassandra' 'couchdb' 'elasticsearch' 'memcached' 'mongodb' 'mysql' 'neo4j' 'postgres' 'rabbitmq' 'redismq' 'rethinkdb' 'riak' 'selenium')

for service in "${services[@]}"
  do
	echo "Starting $service"
	./shippable_services $service start
	
	echo "Stopping $service"
	./shippable_services $service stop
done 

