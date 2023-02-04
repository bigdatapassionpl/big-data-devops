FROM debian:stable

# RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
#	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

#ENV LANG en_US.utf8

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install wget htop -y
RUN apt-get install gpg -y
RUN apt-get install procps -y
RUN apt-get install keychain -y
RUN apt-get install vim -y
RUN apt-get install openssh-server -y
RUN apt-get install -y openjdk-11-jdk

# Bigtop
RUN wget https://dlcdn.apache.org/bigtop/bigtop-3.2.0/repos/debian-11/bigtop.list -O /etc/apt/sources.list.d/bigtop.list

RUN apt-key adv --keyserver keyserver.ubuntu.com  --recv-keys 48FE45F9CB1784BB

RUN apt-get update

#RUN apt-get install ambari-server ambari-agent -y
#RUN apt-get install bigtop-ambari-mpack -y
#RUN ambari-server install-mpack --mpack /usr/lib/bigtop-ambari-mpack/bgtp-ambari-mpack-1.0.0.0-SNAPSHOT-bgtp-ambari-mpack.tar.gz
#RUN ambari-server install-mpack --mpack /var/lib/ambari-server/resources/odpi-ambari-mpack-2.7.5.0.0.tar.gz
#RUN ambari-server install-mpack --mpack /tmp/bgtp-ambari-mpack-1.0.0.0-SNAPSHOT-bgtp-ambari-mpack.tar.gz
#RUN ambari-server setup -s

#RUN apt-get install -y hadoop
#RUN apt-get install -y hadoop-hdfs*
RUN apt-get install -y hadoop\*
RUN apt-get install -y hbase\*

ENV JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64

ENTRYPOINT /bin/bash

EXPOSE 8080

CMD /usr/local/bin/shell.sh ; sleep infinity
