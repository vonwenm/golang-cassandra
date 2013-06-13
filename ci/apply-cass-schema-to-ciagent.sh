#!/bin/sh

cd $(dirname $0)

CASSANDRA_HOME=$(pwd)/cassandra
CASSANDRA_VERSION=1.1.6
CASSANDRA_BIN_HOME=$CASSANDRA_HOME/apache-cassandra-$CASSANDRA_VERSION

if [ ! -x $CASSANDRA_BIN_HOME/bin/cqlsh ]; then
    echo "Missing cassandra csql in $CASSANDRA_BIN_HOME/bin/cqlsh. Try running cassandra-bootstrap.sh"
    exit 1
fi


RPC_HOST=${1:-`hostname -i | tr ' ' '\n' | tail -1`}

echo "Applying steps in $RPC_HOST"

rm /var/casper/core/cassandra.steps.transactions

pushd ..
ruby scripts/apply-steps.rb $CASSANDRA_BIN_HOME/bin/cqlsh $RPC_HOST
popd