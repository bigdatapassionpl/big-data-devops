#!/usr/bin/env bash


find / -iname "ambari.properties"
vim /etc/ambari-server/conf/ambari.properties
vim /etc/ambari-agent/conf/ambari-agent.ini
reboot 
vim /etc/ambari-agent/conf/ambari-agent.ini
vim /etc/ambari-agent/conf/ambari-agent.ini



wget http://central.maven.org/maven2/mysql/mysql-connector-java/8.0.12/mysql-connector-java-8.0.12.jar
mv mysql-connector-java-8.0.12.jar /opt/
ll /opt/ | grep mysql
ambari-server setup --jdbc-db=mysql --jdbc-driver=/opt/mysql-connector-java-8.0.12.jar
