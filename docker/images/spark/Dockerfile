
# https://github.com/apache/spark/blob/branch-3.3/resource-managers/kubernetes/docker/src/main/dockerfiles/spark/Dockerfile

ARG java_image_tag=11-jre-slim

FROM openjdk:${java_image_tag}

ARG spark_uid=185

COPY install-spark.sh /opt/install-spark.sh
RUN bash /opt/install-spark.sh

ENV SPARK_HOME /opt/spark

WORKDIR /opt/spark/work-dir

ENTRYPOINT [ "/opt/entrypoint.sh" ]

# Specify the User that the actual main process will run as
USER ${spark_uid}
