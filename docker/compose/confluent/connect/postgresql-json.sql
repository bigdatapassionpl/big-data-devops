
DROP TABLE IF EXISTS postgres.public."test-product-avro";

CREATE TABLE postgres.public."test-product-avro" (
    RECORD_METADATA json,
    RECORD_CONTENT json,
    LOAD_TIMESTAMP TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

select count(*) from "test-product-avro";

select * from "test-product-avro" limit 5;

select record_content from "test-product-avro" limit 5;
select record_content -> 'id' from "test-product-avro" limit 5;
select record_content -> 'creationDate' from "test-product-avro" limit 5;
select record_content ->> 'creationDate' from "test-product-avro" limit 5;
select record_content -> 'product' from "test-product-avro" limit 5;
select record_content -> 'product' -> 'price' from "test-product-avro" limit 5;
select record_content -> 'product' ->> 'price' from "test-product-avro" limit 5;

select replace(record_content -> 'product' ->> 'price', ',', '.')::DECIMAL from "test-product-avro" limit 5;
select AVG(replace(record_content -> 'product' ->> 'price', ',', '.')::DECIMAL) from "test-product-avro";
