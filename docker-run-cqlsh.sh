CASSANDRA_CONTAINER_IP=`docker inspect cass1 |grep IPA|cut -f4 -d'"'`
docker run -ti --rm springersbm/cassandra-track cqlsh --cql3 $CASSANDRA_CONTAINER_IP
