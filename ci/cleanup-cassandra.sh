#!/bin/sh
cd $(dirname $0)
CASSANDRA_HOME=$(pwd)/cassandra

./stop-cassandra.sh
rm -rf $CASSANDRA_HOME
