
* https://docs.confluent.io/platform/current/connect/references/restapi.html

~~~sql
CREATE USER "kafka" 
    RSA_PUBLIC_KEY='RSA_PUBLIC_KEY_HERE' 
    DEFAULT_ROLE=PUBLIC 
    MUST_CHANGE_PASSWORD=FALSE;

GRANT ROLE SYSADMIN TO USER "kafka";

alter user jsmith set rsa_public_key='MIIBIjANBgkqh...';
~~~

~~~
docker ps
docker exec -it connect bash

cat /etc/kafka-connect/kafka-connect.properties

# alias wget='curl -O'
wget https://repo1.maven.org/maven2/com/snowflake/snowflake-kafka-connector/1.8.1/snowflake-kafka-connector-1.8.1.jar
wget https://repo1.maven.org/maven2/com/snowflake/snowflake-kafka-connector/1.8.1/snowflake-kafka-connector-1.8.1.jar -P /usr/share/confluent-hub-components/
~~~

~~~
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