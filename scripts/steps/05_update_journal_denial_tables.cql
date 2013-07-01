use reports;

DROP TABLE monthly_journals_denials;
DROP TABLE monthly_journals_denials_metadata;

CREATE TABLE monthly_journal_denials(
    bpid_month varchar,
    title varchar,
    jid varchar,
    json varchar,
    PRIMARY KEY (bpid_month, title, jid)
);

CREATE TABLE monthly_journal_denials_metadata(
    bpid_month varchar,
    json varchar,
    PRIMARY KEY (bpid_month)
);