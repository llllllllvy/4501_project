CREATE TABLE IF NOT EXISTS crashes(
    ID INTEGER PRIMARY KEY,
    crash_date  TIMESTAMP,
    number_of_persons_injured INTEGER,
    latitiude FLOAT,
    longitude FLOAT,
    zipcode TEXT
);