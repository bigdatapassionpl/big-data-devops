FROM debian:stable

RUN apt update
RUN apt install -y openjdk-11-jdk
RUN apt install -y wget curl htop

COPY ambari-setup.sh /opt/ambari-setup.sh
RUN #bash /opt/ambari-setup.sh

ENTRYPOINT /bin/bash

EXPOSE 8080

CMD /usr/local/bin/shell.sh ; sleep infinity