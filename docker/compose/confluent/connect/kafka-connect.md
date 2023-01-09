
* https://docs.confluent.io/platform/current/connect/references/restapi.html
* https://www.confluent.io/blog/kafka-connect-deep-dive-converters-serialization-explained/

~~~shell
kafka-topics --bootstrap-server localhost:9092 --list

export TOPIC=debezium.dbserver1.inventory.customers
kafka-console-consumer --bootstrap-server localhost:9092 --topic $TOPIC --property print.key=true --property key.separator=" => " --from-beginning
~~~

~~~sql
CREATE USER "kafka" 
    RSA_PUBLIC_KEY='RSA_PUBLIC_KEY_HERE' 
    DEFAULT_ROLE=PUBLIC 
    MUST_CHANGE_PASSWORD=FALSE;

GRANT ROLE SYSADMIN TO USER "kafka";

alter user jsmith set rsa_public_key='MIIBIjANBgkqh...';
~~~

~~~shell
docker ps
docker exec -it connect bash

cat /etc/kafka-connect/kafka-connect.properties

# alias wget='curl -O'
wget https://repo1.maven.org/maven2/com/snowflake/snowflake-kafka-connector/1.8.1/snowflake-kafka-connector-1.8.1.jar
wget https://repo1.maven.org/maven2/com/snowflake/snowflake-kafka-connector/1.8.1/snowflake-kafka-connector-1.8.1.jar -P /usr/share/confluent-hub-components/
~~~

~~~shell
export CONNECT_URL=http://localhost:8083

export CONNECTOR_NAME=snowflake-snowpipe
export CONNECTOR_NAME=snowflake-snowpipe-streaming
export CONNECTOR_NAME=debezium-postgres

curl $CONNECT_URL | jq

curl $CONNECT_URL/connector-plugins/ | jq

curl $CONNECT_URL/connectors | jq

curl -X POST -H "Content-Type: application/json" --data @$CONNECTOR_NAME.json $CONNECT_URL/connectors | jq

curl $CONNECT_URL/connectors/$CONNECTOR_NAME/status | jq

curl -X DELETE $CONNECT_URL/connectors/$CONNECTOR_NAME | jq

~~~

~~~sql
psql -h localhost -p 5432 -d postgres -U postgres

\l # list databases
\dn # list schemas
\dt inventory.* # list tables in schema
\d+ customers # list columns in table

SET search_path TO inventory;

INSERT INTO customers(id, first_name, last_name, email) VALUES (default, 'Sarah', 'Thompson', 'kitt@acme.com');
INSERT INTO customers VALUES (default, 'Kenneth', 'Anderson', 'kander@acme.com');

INSERT INTO customers(id, first_name, last_name, email)
SELECT id, md5(random()::text), md5(random()::text)::varchar(20), md5(random()::text) 
FROM generate_series(1,100) id;

UPDATE customers SET first_name='Anne Marie' WHERE id=100;

ALTER TABLE customers RENAME COLUMN email TO mail;
~~~