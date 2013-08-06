use reports;

CREATE TABLE monthly_journals_yop(
    bpid_month varchar,
    title varchar,
    jid varchar,
    json varchar,
    PRIMARY KEY (bpid_month, title, jid)
);