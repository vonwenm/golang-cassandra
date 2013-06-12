#!/bin/bash

ruby scripts/apply-steps.rb /usr/share/apache-cassandra-1.1.6/bin/cqlsh localhost

if [ "$?" -ne "0" ]; then
  echo "Applying steps to Cassandra has failed. Please check Cassandra is running, or execute the install-cassandra.sh script at project root."
  exit 1
fi