#!/bin/sh

if [ -s /usr/share/apache-cassandra-1.1.6/bin/cqlsh ]
then
  echo "Cassandra is already installed in this machine at /usr/share/apache-cassandra-1.1.6/bin/cqlsh."
else
  echo "Cassandra not found, trying to run chef-solo to install Cassandra on this machine..."

  pushd ../../infra
  sudo chef-solo -c ./chef/nodes/chef-solo.rb -j ./chef/nodes/cassandra.json
  popd
fi

exit $EC



