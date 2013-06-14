use reports;

CREATE TABLE monthly_book_denials(
    bpid_month varchar,
    title varchar,
    doi varchar,
    json varchar,
    PRIMARY KEY (bpid_month, title, doi)
);

CREATE TABLE monthly_book_denials_metadata(
    bpid_month varchar,
    json varchar,
    PRIMARY KEY (bpid_month)
);