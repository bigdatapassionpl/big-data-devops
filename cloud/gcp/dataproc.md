
* https://cloud.google.com/dataproc/docs/concepts/components/overview
* https://cloud.google.com/dataproc/docs/concepts/versioning/dataproc-release-2.0
* https://cloud.google.com/dataproc/docs/concepts/components/overview
* https://cloud.google.com/dataproc/docs/concepts/accessing/cluster-web-interfaces
* https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/network
* https://cloud.google.com/sdk/gcloud/reference/dataproc/clusters/create
* https://github.com/GoogleCloudDataproc/initialization-actions/tree/master/kafka

~~~
export REGION=europe-central2
export ZONE=europe-central2-a
export CLUSTER_NAME=bigdatacluster

gcloud dataproc clusters create ${CLUSTER_NAME} \
    --region ${REGION} \
    --master-boot-disk-size=30GB \
    --worker-boot-disk-size=30GB \
    --num-masters 1 \
    --num-workers=3 \
    --optional-components=ZOOKEEPER,JUPYTER,ZEPPELIN \
    --initialization-actions gs://goog-dataproc-initialization-actions-${REGION}/kafka/kafka.sh

--metadata "run-on-master=true" \
,gs://goog-dataproc-initialization-actions-${REGION}/kafka/cruise-control.sh
,gs://goog-dataproc-initialization-actions-${REGION}/kafka/kafka-manager.sh
,gs://goog-dataproc-initialization-actions-${REGION}/prometheus/prometheus.sh

gcloud dataproc clusters list --region $REGION
gcloud dataproc clusters delete $CLUSTER_NAME --region $REGION

cssh bigdatacluster-{m,w-0,w-1,w-2}

cp /etc/kafka/conf/server.properties /tmp/
echo -e "listeners = PLAINTEXT://${HOSTNAME}:9092" >> /etc/kafka/conf/server.properties
/etc/init.d/kafka-server restart

systemctl list-unit-files
systemctl status {servicename}

~~~
