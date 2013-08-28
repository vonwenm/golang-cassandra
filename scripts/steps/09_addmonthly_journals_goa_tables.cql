use reports;

CREATE TABLE monthly_goa_journals(
    bpid_month varchar,
    title varchar,
    jid varchar,
    json varchar,
    PRIMARY KEY (bpid_month, title, jid)
);

CREATE TABLE monthly_goa_journals_metadata(
    bpid_month varchar,
    json varchar,
    PRIMARY KEY (bpid_month)
);