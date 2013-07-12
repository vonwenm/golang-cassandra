USE track;

CREATE TABLE counter_missing_dois (
	hourKey bigint,
	columnKey timeuuid,
	json varchar,
	PRIMARY KEY (hourKey, columnKey)
);