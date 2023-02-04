
~~~shell
export DOCKER_IMAGE=bigdatapassion/bigtop:latest
docker rmi -f $DOCKER_IMAGE
docker build --rm -t $DOCKER_IMAGE .
docker images | grep bigdatapassion
docker rm bigtop
docker run -it --name=bigtop -p 8080:8080 $DOCKER_IMAGE bash
~~~

~~~shell
docker cp \
  ~/projects/github/apache/bigtop/bigtop-packages/src/common/bigtop-ambari-mpack/bgtp-ambari-mpack/target/bgtp-ambari-mpack-1.0.0.0-SNAPSHOT-bgtp-ambari-mpack.tar.gz \
  bigtop:/tmp/bgtp-ambari-mpack-1.0.0.0-SNAPSHOT-bgtp-ambari-mpack.tar.gz
~~~

~~~shell
service --status-all

/etc/init.d/hadoop-hdfs-namenode init
/usr/lib/hadoop/libexec/init-hdfs.sh

service hadoop-hdfs-namenode start
service hadoop-hdfs-datanode start

service hadoop-yarn-resourcemanager start
service hadoop-yarn-nodemanager start

service hbase-master start
service hbase-regionserver start

hadoop fs -ls -R /
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar pi 10 1000

wget https://bigdataprogrammers.com/wp-content/plugins/download-attachments/includes/download.php?id=2676 -O emp_data.csv

hadoop fs -copyFromLocal emp_data.csv /tmp/emp_data.csv
hdfs dfs -ls /tmp

echo "create 'emp_data',{NAME => 'cf'}" | hbase shell

hbase org.apache.hadoop.hbase.mapreduce.ImportTsv \
  -Dimporttsv.separator=',' \
  -Dimporttsv.columns='HBASE_ROW_KEY,cf:ename,cf:designation,cf:manager,cf:hire_date,cf:sal,cf:deptno' emp_data \
  /tmp/emp_data.csv

find / -iname mapred-site.xml -print 2>/dev/null
vim /etc/hadoop/conf/mapred-site.xml
~~~