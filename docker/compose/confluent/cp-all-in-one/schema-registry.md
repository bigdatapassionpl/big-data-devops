
~~~shell
export SCHEMA_REGISTRY_URL=http://localhost:8081
export HEADER="Content-Type: application/vnd.schemaregistry.v1+json"

export SCHEMA_ID=1
export VERSION=1
export SUBJECT=test-product-avro-value

curl $SCHEMA_REGISTRY_URL | jq
curl $SCHEMA_REGISTRY_URL/schemas/types | jq
curl $SCHEMA_REGISTRY_URL/mode | jq

curl $SCHEMA_REGISTRY_URL/schemas/ids/$SCHEMA_ID | jq
curl $SCHEMA_REGISTRY_URL/schemas/ids/$SCHEMA_ID/schema
curl $SCHEMA_REGISTRY_URL/schemas/ids/$SCHEMA_ID/versions | jq

curl $SCHEMA_REGISTRY_URL/subjects | jq
curl -X DELETE $SCHEMA_REGISTRY_URL/subjects/$SUBJECT | jq

curl $SCHEMA_REGISTRY_URL/subjects/$SUBJECT/versions | jq
curl $SCHEMA_REGISTRY_URL/subjects/$SUBJECT/versions/$VERSION | jq
curl $SCHEMA_REGISTRY_URL/subjects/$SUBJECT/versions/$VERSION > $SUBJECT.json
curl $SCHEMA_REGISTRY_URL/subjects/$SUBJECT/versions/$VERSION/schema | jq
curl -X POST -H $HEADER --data @$SUBJECT.json $SCHEMA_REGISTRY_URL/subjects/$SUBJECT | jq
curl -X POST -H $HEADER --data @$SUBJECT.json $SCHEMA_REGISTRY_URL/subjects/$SUBJECT/versions | jq
curl -X DELETE $SCHEMA_REGISTRY_URL/subjects/$SUBJECT/versions/$VERSION | jq
~~~