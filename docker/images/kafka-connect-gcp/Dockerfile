FROM confluentinc/cp-kafka-connect-base:7.7.4

USER root

RUN dnf install -y unzip && \
    curl -L https://github.com/googleapis/managedkafka/releases/download/v1.0.5/release-and-dependencies.zip -o /tmp/release-and-dependencies.zip && \
    unzip -n -j /tmp/release-and-dependencies.zip -d /usr/share/java/cp-base-new/ && \
    chmod -R a+r /usr/share/java/cp-base-new/ && \
    unzip -n -j /tmp/release-and-dependencies.zip -d /usr/share/java/kafka/ && \
    chmod -R a+r /usr/share/java/kafka/ && \
    rm -rf /tmp/release-and-dependencies.zip

RUN confluent-hub install --no-prompt snowflakeinc/snowflake-kafka-connector:latest && \
    confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest && \
    confluent-hub install --no-prompt iceberg/iceberg-kafka-connect:latest

#COPY --chown=appuser:appuser --chmod=755 ./run /etc/confluent/docker/run

USER appuser
