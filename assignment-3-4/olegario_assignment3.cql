-- Create a keyspace
CREATE KEYSPACE IF NOT EXISTS db WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };

CREATE TABLE IF NOT EXISTS db.users (
    username text PRIMARY KEY,
    last_name text,
    first_name text,
    email set<text>, 
    mobile text
);

-- Insert some data
INSERT INTO db.users
(username, last_name, first_name, email, mobile)
VALUES ('hubert_ellyson','Olegario', 'Hubert Ellyson', {'hubert.olegario@student.ateneo.edu'}, '639218845946');

INSERT INTO db.users
(username, last_name, first_name, email, mobile)
VALUES ('kim.dohoon', 'Kim', 'Dohoon', {'kim.dohoon@tws.pledis.com'}, '639211234567');

INSERT INTO db.users
(username, last_name, first_name, email, mobile)
VALUES ('shin.junghwan', 'Shin', 'Junghwan', {'shin.junghwan@tws.pledis.com'}, '639212345678');

INSERT INTO db.users
(username, last_name, first_name, email, mobile)
VALUES ('choi.youngjae', 'Choi', 'Youngjae', {'choi.youngjae@tws.pledis.com'}, '639213456789');

INSERT INTO db.users
(username, last_name, first_name, email, mobile)
VALUES ('lee.kyungmin', 'Lee', 'Kyungmin', {'lee.kyungmin@tws.pledis.com'}, '639214567890');

INSERT INTO db.users
(username, last_name, first_name, email, mobile)
VALUES ('han.jihoon', 'Han', 'Jihoon', {'han.jihoon@tws.pledis.com'}, '639214567890');

INSERT INTO db.users
(username, last_name, first_name, email, mobile)
VALUES ('csci1732026', {'csci1732026@test.com', 'csci1732026backup@test.com'}, '639214567890');

CREATE TABLE IF NOT EXISTS db.userpk (
    uid UUID PRIMARY KEY,
    username text,
    last_name text,
    first_name text,
    email set<text>, 
    mobile text
);

-- Insert some data
INSERT INTO db.userpk
(uid, username, last_name, first_name, email, mobile)
VALUES (uuid(), 'hubert_ellyson','Olegario', 'Hubert Ellyson', {'hubert.olegario@student.ateneo.edu'}, '639218845946');

INSERT INTO db.userpk
(uid, username, last_name, first_name, email, mobile)
VALUES (uuid(), 'kim.dohoon', 'Kim', 'Dohoon', {'kim.dohoon@tws.pledis.com'}, '639211234567');

INSERT INTO db.userpk
(uid, username, last_name, first_name, email, mobile)
VALUES (uuid(), 'shin.junghwan', 'Shin', 'Junghwan', {'shin.junghwan@tws.pledis.com'}, '639212345678');

INSERT INTO db.userpk
(uid, username, last_name, first_name, email, mobile)
VALUES (uuid(), 'choi.youngjae', 'Choi', 'Youngjae', {'choi.youngjae@tws.pledis.com'}, '639213456789');

INSERT INTO db.userpk
(uid, username, last_name, first_name, email, mobile)
VALUES (uuid(), 'lee.kyungmin', 'Lee', 'Kyungmin', {'lee.kyungmin@tws.pledis.com'}, '639214567890');

INSERT INTO db.userpk
(uid, username, last_name, first_name, email, mobile)
VALUES (uuid(), 'han.jihoon', 'Han', 'Jihoon', {'han.jihoon@tws.pledis.com'}, '639214567890');

INSERT INTO db.userpk
(uid, username, email, mobile)
VALUES (uuid(), 'csci1732026', {'csci1732026@test.com', 'csci1732026backup@test.com'}, '639214567890');