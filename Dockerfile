FROM ubuntu:14.04

# Install java 6
RUN apt-get update -y
RUN apt-get install -y openjdk-6-jdk
RUN apt-get install -y libjna-java
RUN apt-get install -y curl

# Install the Python CQL driver and the DataStax Community package

RUN echo "deb http://debian.datastax.com/community stable main" >> /etc/apt/sources.list.d/cassandra.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -
RUN apt-get update -y
RUN apt-get install -y python-cql
RUN apt-get install -y dsc1.1 cassandra=1.1.11

RUN sed -i -e "s/^rpc_address.*/rpc_address: 0.0.0.0/" /etc/cassandra/cassandra.yaml
RUN sed -i -e "s/\(ulimit.*\)/#\1/" /etc/init.d/cassandra

RUN apt-get install -yq net-tools

VOLUME ["/var/lib/cassandra", "/var/log/cassandra"]

ADD scripts/steps /home/casper/casper/cassandra/scripts/steps
ADD try-port.sh /tmp/try-port.sh
ADD start-cassandra start-cassandra 

EXPOSE 9160 

CMD ./start-cassandra > start-cassandra.out.txt 2>&1 & /tmp/try-port.sh localhost 9160 20 && for f in `find /home/casper/casper/cassandra/scripts/steps/ -type f | sort`; do echo $f; cqlsh --cql3 -f $f; done  && tail -f start-cassandra.out.txt

