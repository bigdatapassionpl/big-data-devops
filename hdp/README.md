
# Instalacja dystrybucji HDP 3.1




## Wrzucenie skryptów

AWS:
~~~bash
for i in {1..5..1}; do scp -r hdp-centos7-local-prepare.sh ec2-user@aws${i}://tmp; done
scp -r hdp-centos7-ambari-2.7.3.0-install.sh ec2-user@aws1://tmp
~~~

Oracle Cloud:
~~~bash
for i in {1..5..1}; do scp -r hdp-centos7-local-prepare.sh opc@hdpoc${i}://tmp; done
for i in {1..5..1}; do scp -r hdp-centos7-hostname-set.sh opc@hdpoc${i}://tmp; done
scp -r hdp-centos7-ambari-2.7.3.0-install.sh opc@hdpoc1://tmp
~~~

Oktawawe:
~~~bash
for i in {1..5..1}; do scp -r hdp-centos7-local-prepare.sh hdp${i}://tmp; done
for i in {1..5..1}; do scp -r hdp-centos7-hostname-set.sh hdp${i}://tmp; done
scp -r hdp-centos7-ambari-2.7.3.0-install.sh hdp1://tmp
~~~




## Instalacja


Przygotowanie maszyn (na wszystkich)
~~~bash
chmod u+x /tmp/hdp-centos7-local-prepare.sh
chmod u+x /tmp/hdp-centos7-hostname-set.sh

/tmp/hdp-centos7-hostname-set.sh hdp.bigdatapassion.com

/tmp/hdp-centos7-local-prepare.sh

reboot
~~~

Instalacja Ambari (na głównej)
~~~bash
chmod u+x /tmp/hdp-centos7-ambari-2.7.3.0-install.sh

/tmp/hdp-centos7-ambari-2.7.3.0-install.sh
~~~









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

