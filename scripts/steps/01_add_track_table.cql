CREATE KEYSPACE track
         WITH strategy_class = 'org.apache.cassandra.locator.SimpleStrategy'
         AND strategy_options:replication_factor='2';

USE track;

CREATE TABLE counter_json (
	hourKey bigint,
	columnKey timeuuid,
	json varchar,
	PRIMARY KEY (hourKey, columnKey)
);

CREATE TABLE deposit_json (
	hourKey bigint,
	columnKey timeuuid,
	json varchar,
	PRIMARY KEY (hourKey, columnKey)
);

CREATE TABLE mps_deposit_log_upload_log (
	dayKey bigint,
	hour varchar,
	json varchar,
	PRIMARY KEY (dayKey,hour)
);