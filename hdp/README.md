
# Instalacja dystrybucji HDP 2.6

### Sandbox

Wrzucenie skryptów:
~~~bash
scp -r -P 2222 hdp-centos7-hosts-sandbox.sh root@localhost://tmp
scp -r -P 2222 hdp-centos7-local-prepare.sh root@localhost://tmp
scp -r -P 2222 hdp-centos7-ambari-2.7.1.0-install.sh root@localhost://tmp
~~~

Przygotowanie maszyn
~~~bash
ssh root@localhost -p 2222

chmod u+x /tmp/hdp-centos7-hosts-sandbox.sh
chmod u+x /tmp/hdp-centos7-local-prepare.sh

/tmp/hdp-centos7-hosts-sandbox.sh
/tmp/hdp-centos7-local-prepare.sh

reboot
~~~

Instalacja Ambari
~~~bash
ssh root@localhost -p 2222

chmod u+x /tmp/hdp-centos7-ambari-2.7.1.0-install.sh

/tmp/hdp-centos7-ambari-2.7.1.0-install.sh
~~~



### Klaster

Własne maszyny HDP:
~~~bash
for i in {1..5..1}; do scp -r hdp-centos7-local-prepare.sh hdp${i}://tmp; done
scp -r hdp-centos7-ambari-2.7.1.0-install.sh hdp1://tmp
~~~


### Amazon EC2

AWS:
~~~bash
for i in {1..5..1}; do scp -r hdp-centos7-local-prepare.sh ec2-user@aws${i}://tmp; done
~~~



### Google Cloud

TODO

### Azure

TODO
