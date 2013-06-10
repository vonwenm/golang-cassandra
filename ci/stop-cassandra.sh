#!/bin/sh

cd $(dirname $0)

CASSANDRA_HOME=$(pwd)/cassandra
CASSANDRA_VERSION=1.1.6
CASSANDRA_BIN_HOME=$CASSANDRA_HOME/apache-cassandra-$CASSANDRA_VERSION

CASSANDRA_LOGS=$CASSANDRA_HOME/log
CASSANDRA_DATA=$CASSANDRA_HOME/data
CASSANDRA_COMMIT=CASSANDRA_HOME/commit
CASSANDRA_PAGES=CASSANDRA_HOME/saved_caches

if [ -f $CASSANDRA_HOME/cassandra.pid ] && ps -p $(<$CASSANDRA_HOME/cassandra.pid) > /dev/null 2>&1; then
    echo Stopping cassandra
    kill $(<$CASSANDRA_HOME/cassandra.pid)
    sleep 5
fi

PID=$(ps -o pid,args | grep -e [C]assandraDaemon  | awk '{print $1}')
if [ ! -z "$PID" ]; then
    echo "There is a cassandra running with pid $PID... killing it"
    kill -9 $PID
fi




