CREATE KEYSPACE Zipkin 
  WITH strategy_class = 'org.apache.cassandra.locator.SimpleStrategy'
  AND strategy_options:replication_factor='2';

USE Zipkin;

CREATE TABLE AnnotationsIndex (
  key blob,
  column1 bigint,
  value blob,
  PRIMARY KEY (key, column1)
);

CREATE TABLE Dependencies (
  key blob,
  column1 bigint,
  value blob,
  PRIMARY KEY (key, column1)
);

CREATE TABLE DurationIndex (
  key blob,
  column1 bigint,
  value blob,
  PRIMARY KEY (key, column1)
);

CREATE TABLE ServiceNameIndex (
  key blob,
  column1 bigint,
  value blob,
  PRIMARY KEY (key, column1)
);

CREATE TABLE ServiceNames (
  key blob,
  column1 blob,
  value blob,
  PRIMARY KEY (key, column1)
);

CREATE TABLE ServiceSpanNameIndex (
  key blob,
  column1 bigint,
  value blob,
  PRIMARY KEY (key, column1)
);

CREATE TABLE SpanNames (
  key blob,
  column1 blob,
  value blob,
  PRIMARY KEY (key, column1)
);

CREATE TABLE TopAnnotations (
  key blob,
  column1 bigint,
  value blob,
  PRIMARY KEY (key, column1)
);

CREATE TABLE Traces (
  key blob,
  column1 blob,
  value blob,
  PRIMARY KEY (key, column1)
);
