USE track;

CREATE TABLE counter_database_json (
        hourKey bigint,
        columnKey timeuuid,
        json varchar,
        PRIMARY KEY (hourKey, columnKey)
);

