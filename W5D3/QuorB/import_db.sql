-- DROP TABLE IF EXISTS plays;
-- CREATE TABLE plays (
--   id INTEGER PRIMARY KEY,
--   title TEXT NOT NULL,
--   year INTEGER NOT NULL,
--   playwright_id INTEGER NOT NULL,
--   FOREIGN KEY (playwright_id) REFERENCES playwrights(id)
-- );
-- DROP TABLE if exists playwrights;
-- CREATE TABLE playwrights (
--   id INTEGER PRIMARY KEY,
--   name TEXT NOT NULL,
--   birth_year INTEGER
-- );
-- INSERT INTO
--   playwrights (name, birth_year)
-- VALUES
--   ('Arthur Miller', 1915),
--   ('Eugene O''Neill', 1888);
-- INSERT INTO
--   plays (title, year, playwright_id)
-- VALUES
--   ('All My Sons', 1947, (SELECT id FROM playwrights WHERE name = 'Arthur Miller')),
--   ('Long Day''s Journey Into Night', 1956, (SELECT id FROM playwrights WHERE name = 'Eugene O''Neill'));
-- https://lucid.app/lucidchart/a2e84d05-bb3a-40a6-acd3-74c7eccced43/edit?beaconFlowId=323DFF30AF6C85EB&page=0_0#?folder_id=home&browser=icon
PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE if EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR NOT NULL,
    lname VARCHAR NOT NULL,
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (user_id) REFERENCES users(id)
);