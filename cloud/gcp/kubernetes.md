
* https://cloud.google.com/sdk/gcloud/reference/container/clusters

~~~shell
export REGION=europe-central2
export ZONE=europe-central2-a
export CLUSTER=bigdatapassion

gcloud container clusters list

#gcloud container clusters create $CLUSTER

time gcloud container clusters create $CLUSTER \
    --num-nodes=3 \
    --machine-type=e2-standard-2
    
time gcloud container clusters resize $CLUSTER \
    --num-nodes 5

gcloud container clusters delete $CLUSTER
~~~