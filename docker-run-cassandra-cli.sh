CASSANDRA_CONTAINER_IP=`docker inspect cass1 |grep IPA|cut -f4 -d'"'`
docker run -ti --rm springersbm/cassandra-track cassandra-cli -h $CASSANDRA_CONTAINER_IP
