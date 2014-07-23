CREATE KEYSPACE Zipkin
  WITH strategy_class = 'NetworkTopologyStrategy'
  AND strategy_options:datacenter1 = '1';

USE Zipkin;

CREATE TABLE AnnotationsIndex (
  KEY blob PRIMARY KEY
);

CREATE TABLE ServiceSpanNameIndex (
  KEY blob PRIMARY KEY
);

CREATE TABLE Dependencies (
  KEY blob PRIMARY KEY
);

CREATE TABLE Traces (
  KEY blob PRIMARY KEY
);

CREATE TABLE SpanNames (
  KEY blob PRIMARY KEY
);

CREATE TABLE DurationIndex (
  KEY blob PRIMARY KEY
);

CREATE TABLE ServiceNameIndex (
  KEY blob PRIMARY KEY
);

CREATE TABLE TopAnnotations (
  KEY blob PRIMARY KEY
);

CREATE TABLE ServiceNames (
  KEY blob PRIMARY KEY
);
