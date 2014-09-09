CASSANDRA_CONTAINER_IP=`docker inspect springer-cass |grep IPA|cut -f4 -d'"'`
docker run -ti --rm springer/cassandra cqlsh --cql3 $CASSANDRA_CONTAINER_IP
