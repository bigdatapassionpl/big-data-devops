FROM confluentinc/cp-kafka-connect-base:7.7.4

# Switch to root user to install packages
USER root

RUN dnf install -y unzip && \
    dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y && \
    dnf install netcat -y && \
    curl -L https://github.com/googleapis/managedkafka/releases/download/v1.0.5/release-and-dependencies.zip -o /tmp/release-and-dependencies.zip && \
    unzip -n -j /tmp/release-and-dependencies.zip -d /tmp/release-and-dependencies/ && \
    unzip -n -j /tmp/release-and-dependencies.zip -d /usr/share/java/cp-base-new/ && \
    unzip -n -j /tmp/release-and-dependencies.zip -d /usr/share/java/kafka/ && \
    unzip -n -j /tmp/release-and-dependencies.zip -d /usr/share/java/ && \
    unzip -n -j /tmp/release-and-dependencies.zip -d /etc/kafka-connect/jars/ && \
    chmod -R a+r /etc/kafka-connect/jars/ && \
    rm -rf /tmp/release-and-dependencies.zip

COPY --chown=appuser:appuser --chmod=755 ./run /etc/confluent/docker/run

# Switch back to the original user
USER appuser


