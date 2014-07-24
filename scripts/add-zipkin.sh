#!/usr/bin/env bash

set -e
set -u

CASSANDRA_CONF=/etc/cassandra/conf/cassandra.yaml
HOST=`grep rpc_addr $CASSANDRA_CONF | cut -f2 -d' '`
CLI=/usr/share/apache-cassandra-1.1.6/bin/cassandra-cli 
SCHEMA_URL=https://raw.githubusercontent.com/twitter/zipkin/master/zipkin-cassandra/src/schema/cassandra-schema.txt
LIST_KEYSPACES_FILE=/tmp/list-keyspaces.txt
ZIPKIN_SCHEMA_FILE=/tmp/zipkin-schema.txt

if [ ! -f "$CASSANDRA_CONF" ];then
  echo "Error! $CASSANDRA_CONF not found."
  exit 1
fi

if [ ! -f "$CLI" ];then
  echo "Error! $CLI not found."
  exit 1
fi

if [ -z "$HOST" ];then
  echo "Error! Unable to get rpc_addr from $CASSANDRA_CONF"
  exit 1
fi

echo "show keyspaces;" > $LIST_KEYSPACES_FILE

if $CLI -h $HOST -f $LIST_KEYSPACES_FILE | grep -iq zipkin ; then
  echo "Zipkin schema already installed."
else
  echo "Installing Zipkin schema..."
  curl -s $SCHEMA_URL | grep -v ^connect > $ZIPKIN_SCHEMA_FILE
  $CLI -h $HOST -f $ZIPKIN_SCHEMA_FILE
fi
