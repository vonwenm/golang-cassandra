#!/bin/sh


if [ -s /usr/share/apache-cassandra-1.1.6/bin/cqlsh ]
then
  echo "Build track store cassandra schema in $1 ..."
  echo "script dir is `dirname $0`"
  script_dir=`dirname $0`
  echo "script dir is $script_dir"

  if [ $# -eq 0 ]
  then
     echo "Hostname not specified"
     exit 1
  else
     RPC_HOST=$1
  fi

  /usr/share/apache-cassandra-1.1.6/bin/cqlsh $RPC_HOST 9160 --cql3 --file $script_dir/trackdb-schema.txt > /tmp/buildTrackStoreSchema.log
  /usr/share/apache-cassandra-1.1.6/bin/cqlsh $RPC_HOST 9160 --cql3 --file $script_dir/report-schema.txt > /tmp/buildReportSchema.log

  EC=$?
  echo returning error code $EC
  exit $EC
else
  echo "Cassandra not found"
  exit 1
fi


