
~~~shell
docker exec -it ksqldb-server /bin/bash
~~~

~~~sql
SET 'auto.offset.reset' = 'earliest';
    person_id BIGINT KEY,
CREATE OR REPLACE STREAM PERSON_STREAM (
    id VARCHAR KEY,
    creationDate VARCHAR,
    person STRUCT<
        name VARCHAR,
        phoneNumber VARCHAR,
        streetName VARCHAR,
        number INT,
        city VARCHAR,
        country VARCHAR,
        animal VARCHAR
        >
    )
WITH (KAFKA_TOPIC='test-person',
    VALUE_FORMAT='JSON',
    PARTITIONS=1);

show streams;
DESCRIBE person_stream;

SELECT * FROM person_stream LIMIT 10;
SELECT
    id,
    creationDate,
    person->name,
    person->phoneNumber,
    person->streetName,
    person->number,
    person->city,
    person->country,
    person->animal
FROM person_stream
WHERE person->number < 1000
LIMIT 10;

CREATE STREAM person_amount_limit_stream WITH (kafka_topic = 'test-person-amount-limit') AS
SELECT
    id,
    creationDate,
    person->name,
    person->phoneNumber,
    person->streetName,
    person->number,
    person->city,
    person->country,
    person->animal
FROM person_stream
WHERE person->number < 1000;

PRINT 'test-person-amount-limit' FROM BEGINNING LIMIT 10;

SELECT * FROM person_amount_limit_stream limit 10;

drop stream person_stream;
drop stream person_amount_limit_stream;
~~~