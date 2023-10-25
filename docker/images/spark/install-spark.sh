#!/bin/bash

export SPARK_HOME=/opt/spark

# OS preparation
set -ex && \
apt-get update && \
ln -s /lib /lib64 && \
apt install -y bash tini libc6 libpam-modules krb5-user libnss3 procps net-tools && \
mkdir -p /opt/spark && \
mkdir -p /opt/spark/examples && \
mkdir -p /opt/spark/work-dir && \
touch /opt/spark/RELEASE && \
rm /bin/sh && \
ln -sv /bin/bash /bin/sh && \
echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su && \
chgrp root /etc/passwd && chmod ug+rw /etc/passwd && \
rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/*

# OS preparation - PySpark
mkdir ${SPARK_HOME}/python
apt-get update && \
apt install -y python3 python3-pip && \
pip3 install --upgrade pip setuptools && \
# Removed the .cache to save space
rm -rf /root/.cache && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/*

# Install Apache Spark
export SPARK_VERSION="3.5.0"
export SPARK_BUNDLE=spark-${SPARK_VERSION}-bin-hadoop3
#export SPARK_BUNDLE=spark-${SPARK_VERSION}-bin-hadoop3-scala2.13.tgz

wget --quiet https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_BUNDLE}.tgz -P /opt/spark
tar xzf /opt/spark/${SPARK_BUNDLE}.tgz -C /opt/spark

export SPARK_SOURCE="/opt/spark/${SPARK_BUNDLE}"
mv ${SPARK_SOURCE}/jars /opt/spark/jars
mv ${SPARK_SOURCE}/bin /opt/spark/bin
mv ${SPARK_SOURCE}/sbin /opt/spark/sbin
mv ${SPARK_SOURCE}/kubernetes/dockerfiles/spark/entrypoint.sh /opt/
mv ${SPARK_SOURCE}/kubernetes/dockerfiles/spark/decom.sh /opt/
mv ${SPARK_SOURCE}/examples /opt/spark/examples
mv ${SPARK_SOURCE}/kubernetes/tests /opt/spark/tests
mv ${SPARK_SOURCE}/data /opt/spark/data

mv ${SPARK_SOURCE}/python/pyspark ${SPARK_HOME}/python/pyspark
mv ${SPARK_SOURCE}/python/lib ${SPARK_HOME}/python/lib

chmod g+w /opt/spark/work-dir
chmod a+x /opt/decom.sh

rm -rf /opt/spark/${SPARK_BUNDLE}
rm -rf /opt/spark/${SPARK_BUNDLE}.tgz
