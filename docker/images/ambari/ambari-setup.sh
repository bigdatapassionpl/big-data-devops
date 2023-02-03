#!/bin/bash

cd /opt/

wget https://dlcdn.apache.org/maven/maven-3/3.8.7/binaries/apache-maven-3.8.7-bin.tar.gz
tar -zxf apache-maven-3.8.7-bin.tar.gz
mv apache-maven-3.8.7 maven

#export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export M2_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}
mvn --version

alias python=python2.7
ln -s /usr/bin/python2.7 /usr/bin/python

cd /opt/

#wget https://www-eu.apache.org/dist/ambari/ambari-2.7.7/apache-ambari-2.7.7-src.tar.gz
#tar -zxf apache-ambari-2.7.7-src.tar.gz
#cd /opt/apache-ambari-2.7.7-src

git clone https://github.com/apache/ambari.git
cd /opt/ambari
#git checkout branch-2.7.7

mvn versions:set -DnewVersion=2.7.7.0.0

pushd ambari-metrics
mvn versions:set -DnewVersion=2.7.7.0.0
popd

mvn -B clean install jdeb:jdeb -DnewVersion=2.7.7.0.0 -DbuildNumber=388e072381e71c7755673b7743531c03a4d61be8 -DskipTests -Dpython.ver="python >= 2.6"

#apt-get install ./ambari-server*.deb
apt-get install -y /opt/ambari/ambari-server/target/ambari-server_2.7.7.0-0-dist.deb

ambari-server setup -s

