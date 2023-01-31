FROM debian:stable

COPY ambari-setup.sh /opt/ambari-setup.sh
RUN bash /opt/ambari-setup.sh

ENTRYPOINT /bin/bash

EXPOSE 8080

CMD /usr/local/bin/shell.sh ; sleep infinity