-- Create a keyspace
CREATE KEYSPACE IF NOT EXISTS db WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };

CREATE TABLE IF NOT EXISTS db.users (
    last_name text,
    first_name text,
    email text, 
    mobile text
);

-- Insert some data
INSERT INTO db.users
(last_name, first_name, email, mobile)
VALUES ('Olegario', 'Hubert Ellyson', 'hubert.olegario@student.ateneo.edu', '639218845946');

INSERT INTO db.users
(last_name, first_name, email, mobile)
VALUES ('Kim', 'Dohoon', 'kim.dohoon@tws.pledis.com', '639211234567');

INSERT INTO db.users
(last_name, first_name, email, mobile)
VALUES ('Shin', 'Junghwan', 'shin.junghwan@tws.pledis.com', '639212345678');

INSERT INTO db.users
(last_name, first_name, email, mobile)
VALUES ('Choi', 'Youngjae', 'choi.youngjae@tws.pledis.com', '639213456789');

INSERT INTO db.users
(last_name, first_name, email, mobile)
VALUES ('Lee', 'Kyungmin', 'lee.kyungmin@tws.pledis.com', '639214567890');

INSERT INTO db.users
(last_name, first_name, email, mobile)
VALUES ('Lee', 'Kyungmin', 'lee.kyungmin@tws.pledis.com', '639214567890');

INSERT INTO db.users
(last_name, email, mobile)
VALUES ('csci1732026', 'csci1732026@test.com', '639123456789');

INSERT INTO db.users
(last_name, email, mobile)
VALUES ('csci1732026', 'csci1732026backup@test.com', '639123456789');