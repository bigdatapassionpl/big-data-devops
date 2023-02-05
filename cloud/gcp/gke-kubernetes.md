
* https://cloud.google.com/sdk/gcloud/reference/container/clusters

~~~shell
export GKE_CLUSTER=bigdatapassion

gcloud container clusters list

#gcloud container clusters create $GKE_CLUSTER

time gcloud container clusters create $GKE_CLUSTER \
    --num-nodes=5 \
    --machine-type=e2-standard-2

time gcloud container clusters create $GKE_CLUSTER \
    --num-nodes=1 \
    --machine-type=e2-standard-2 \
    --enable-autoscaling --min-nodes=1 --max-nodes=5
    
time gcloud container clusters resize $GKE_CLUSTER \
    --num-nodes 3

gcloud container clusters delete $GKE_CLUSTER

gcloud container clusters get-credentials $GKE_CLUSTER
~~~