FROM airbyte/source-mssql:0.4.28

RUN sed -i 's/TLSv1, TLSv1.1,//g' /usr/lib/jvm/java-17-amazon-corretto/conf/security/java.security

#RUN cat /usr/lib/jvm/java-17-amazon-corretto/conf/security/java.security | grep jdk.tls.disabledAlgorithms; java
