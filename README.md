# Big Data DevOps

Instalacja HDP na jednym węźle (tryb pseudo-distributed):

~~~bash
scp -r -P 2222 hdp-centos7-local-prepare.sh root@localhost://root
scp -r -P 2222 hdp-centos7-local-ambari-install.sh root@localhost://root

ssh root@localhost -p 2222

chmod u+x hdp-centos7-local-prepare.sh
chmod u+x hdp-centos7-local-ambari-install.sh

./hdp-centos7-local-prepare.sh
reboot
./hdp-centos7-local-ambari-install.sh
~~~

Instalacja w AWS na wielu węzłach:

~~~bash
for i in {1..5..1}; do scp -r hdp-centos7-local-prepare.sh ec2-user@aws${i}://home/ec2-user; done
~~~

Instalacja na maszynach z root
~~~bash
for i in {1..5..1}; do scp -r hdp-centos7-local-prepare.sh hdp${i}://tmp; done
for i in {1..5..1}; do scp -r hdp-centos7-local-ambari-install.sh hdp1://tmp; done
~~~