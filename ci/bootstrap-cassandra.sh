#!/bin/bash 

export PATH=/usr/local/python/go/python2.6/bin:$PATH

set -e # Makes the script exit as soon as an error happens

cd $(dirname $0)
SCRIPT_PATH=$(pwd)


CASSANDRA_HOME=$(pwd)/cassandra
CASSANDRA_VERSION=1.1.6
CASSANDRA_BIN_HOME=$CASSANDRA_HOME/apache-cassandra-$CASSANDRA_VERSION

CASSANDRA_MIRROR=http://repo.tools.springer-sbm.com/repos/cassandra

CASSANDRA_LOGS=$CASSANDRA_HOME/log
CASSANDRA_DATA=$CASSANDRA_HOME/data
CASSANDRA_COMMIT=$CASSANDRA_HOME/commit
CASSANDRA_PAGES=$CASSANDRA_HOME/saved_caches

# Killing old instances of cassandra if running 
sh ./stop-cassandra.sh


# echo Deleting all old data
# rm -rf $CASSANDRA_DATA $CASSANDRA_COMMIT $CASSANDRA_PAGES
mkdir -p $CASSANDRA_HOME $CASSANDRA_LOGS $CASSANDRA_DATA $CASSANDRA_COMMIT $CASSANDRA_PAGES

cd $CASSANDRA_HOME

# Change the config to point $CASSANDRA_HOME
if [ ! -d $CASSANDRA_BIN_HOME ]; then
    echo "Uncompressing cassandra"
    curl $CASSANDRA_MIRROR/$CASSANDRA_VERSION/apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz | tar -xzf -
    sed -i "s|/var/log/cassandra|$CASSANDRA_LOGS|"  $CASSANDRA_BIN_HOME/conf/*
    sed -i "s|/var/lib/cassandra|$CASSANDRA_HOME|"  $CASSANDRA_BIN_HOME/conf/*
fi

export MAX_HEAP_SIZE="1G"
export HEAP_NEWSIZE="800M"

$CASSANDRA_BIN_HOME/bin/cassandra -p $CASSANDRA_HOME/cassandra.pid
sleep 5

cd $SCRIPT_PATH 
sh ./apply-cass-schema-to-ciagent.sh localhost


