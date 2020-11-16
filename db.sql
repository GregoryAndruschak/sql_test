DROP DATABASE testdb;
CREATE DATABASE testdb with ENCODING = 'UTF8';

ALTER DATABASE testdb OWNER TO postgres;

\connect testdb

CREATE SCHEMA myschema;

CREATE TABLE myschema.post_office (
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL UNIQUE,
    lat NUMERIC NOT NULL,
    lon NUMERIC NOT NULL,
    UNIQUE (lat, lon), 
);

CREATE TYPE myschema.gender_choice AS ENUM ('M', 'F');

CREATE TABLE myschema.client (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    date_of_birth TIMESTAMP,
    gender myschema.gender_choice,
    city INTEGER REFERENCES myschema.post_office (id),
);

INSERT INTO myschema.post_office VALUES ('kyiv', 50.449794999999995, 30.523101099999998)
INSERT INTO myschema.post_office VALUES ('lviv', 49.81615180000001, 24.022015)
INSERT INTO myschema.post_office VALUES ('odessa', 46.48680962268097, 30.727521102350885)

INSERT INTO myschema.client (first_name, last_name, date_of_birth, gender, city)
SELECT ('Gregory', 'Andruschak', '1999-06-17 00:00:00', 'M', id) from myschema.post_office WHERE city='kyiv';
INSERT INTO myschema.client (first_name, last_name, date_of_birth, gender, city)
SELECT ('Andrii', 'Naumenko', '1997-05-18 00:00:00', 'M', id) from myschema.post_office WHERE city='kyiv';
INSERT INTO myschema.client (first_name, last_name, date_of_birth, gender, city)
SELECT ('Dmitii', 'Kozak', '1998-04-19 00:00:00', 'M', id) from myschema.post_office WHERE city='lviv';
INSERT INTO myschema.client (first_name, last_name, date_of_birth, gender, city)
SELECT ('Vasylyna', 'Pupkina', '1995-06-17 00:00:00', 'F', id) from myschema.post_office WHERE city='odessa';
