FROM debian:stable

RUN #apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
#	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

#ENV LANG en_US.utf8

RUN cat /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install wget htop -y
RUN apt install gpg -y

RUN wget https://dlcdn.apache.org/bigtop/bigtop-3.2.0/repos/debian-11/bigtop.list -O /etc/apt/sources.list.d/bigtop.list

RUN apt-key adv --keyserver keyserver.ubuntu.com  --recv-keys 48FE45F9CB1784BB

RUN apt-get update
RUN apt-get install ambari-server -y

ENTRYPOINT /bin/bash

EXPOSE 8080

CMD /usr/local/bin/shell.sh ; sleep infinity
