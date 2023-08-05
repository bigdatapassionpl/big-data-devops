
* https://cloud.google.com/sdk/gcloud/reference/container/clusters

~~~shell
export GKE_CLUSTER=bigdatapassion

gcloud container get-server-config

gcloud container clusters list

#gcloud container clusters create $GKE_CLUSTER

time gcloud container clusters create $GKE_CLUSTER \
    --num-nodes=3 \
    --machine-type=e2-standard-2

time gcloud container clusters create $GKE_CLUSTER \
    --num-nodes=1 \
    --machine-type=e2-standard-2 \
    --enable-autoscaling --min-nodes=1 --max-nodes=5 \
    --cluster-version=1.23.16-gke.2500

time gcloud container clusters resize $GKE_CLUSTER \
    --num-nodes 5

gcloud container clusters delete $GKE_CLUSTER

gcloud container clusters get-credentials $GKE_CLUSTER
~~~