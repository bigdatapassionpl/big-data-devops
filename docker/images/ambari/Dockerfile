#FROM debian:stable
FROM debian:9.13

RUN apt update
RUN #apt install -y openjdk-11-jdk
RUN apt install -y openjdk-8-jdk
RUN apt install -y wget curl htop vim
RUN apt install -y bzip2 git
RUN apt install -y python2.7

COPY ambari-setup.sh /opt/ambari-setup.sh
# RUN bash /opt/ambari-setup.sh

ENTRYPOINT /bin/bash

EXPOSE 8080

CMD /usr/local/bin/shell.sh ; sleep infinity