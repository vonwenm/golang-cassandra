USE reports;

CREATE TABLE daily_db1_user_activity(
    platform_bp_day varchar,
    database varchar,
    json varchar,
    PRIMARY KEY (platform_bp_day, database)
);

