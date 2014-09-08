USE reports;

DROP TABLE daily_db1_user_activity;

CREATE TABLE daily_db1_user_activity (
            day varchar,
            bpid varchar,
            platform varchar,
            database varchar,
            activity varchar,
            bpNameCount varchar,
            PRIMARY KEY (day, bpid, platform, database, activity)
            );
