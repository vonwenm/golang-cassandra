#!/bin/sh

sh scripts/apply-cass-schema.sh localhost

if [ "$?" -ne "0" ]; then
  echo "Applying the schema to Cassandra has failed. Please check Cassandra is running, or execute the install-cassandra.sh script at project root."
  exit 1
fi
