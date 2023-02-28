
SET 'auto.offset.reset' = 'earliest';

show streams;
show tables;
show topics;

CREATE TABLE movies (ID INT PRIMARY KEY, title VARCHAR, release_year INT)
    WITH (kafka_topic='movies', partitions=1, value_format='avro');

CREATE STREAM ratings (MOVIE_ID INT KEY, rating DOUBLE)
    WITH (kafka_topic='ratings', partitions=1, value_format='avro');

describe movies extended;
describe ratings extended;

INSERT INTO movies (id, title, release_year) VALUES (294, 'Die Hard', 1998);
INSERT INTO movies (id, title, release_year) VALUES (354, 'Tree of Life', 2011);
INSERT INTO movies (id, title, release_year) VALUES (782, 'A Walk in the Clouds', 1995);
INSERT INTO movies (id, title, release_year) VALUES (128, 'The Big Lebowski', 1998);
INSERT INTO movies (id, title, release_year) VALUES (780, 'Super Mario Bros.', 1993);

select count(*)
from movies
group by 1
EMIT CHANGES LIMIT 10;

INSERT INTO ratings (movie_id, rating) VALUES (294, 8.2);
INSERT INTO ratings (movie_id, rating) VALUES (294, 8.5);
INSERT INTO ratings (movie_id, rating) VALUES (354, 9.9);
INSERT INTO ratings (movie_id, rating) VALUES (354, 9.7);
INSERT INTO ratings (movie_id, rating) VALUES (782, 7.8);
INSERT INTO ratings (movie_id, rating) VALUES (782, 7.7);
INSERT INTO ratings (movie_id, rating) VALUES (128, 8.7);
INSERT INTO ratings (movie_id, rating) VALUES (128, 8.4);
INSERT INTO ratings (movie_id, rating) VALUES (780, 2.1);

select * from ratings limit 10;

select movie_id, count(*)
from ratings
group by movie_id
EMIT CHANGES LIMIT 10;

select count(*)
from ratings
group by 1
EMIT CHANGES LIMIT 10;

SELECT ratings.movie_id AS ID, title, release_year, rating
FROM ratings
LEFT JOIN movies ON ratings.movie_id = movies.id
EMIT CHANGES LIMIT 10;
