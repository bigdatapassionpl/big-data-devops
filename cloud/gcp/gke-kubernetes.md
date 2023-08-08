
* https://cloud.google.com/sdk/gcloud/reference/container/clusters

~~~shell
gcloud components install gke-gcloud-auth-plugin
gcloud components update

export GKE_CLUSTER=bigdatapassion
export GKE_VM_TYPE=e2-standard-4
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

gcloud container get-server-config

gcloud container clusters list

#gcloud container clusters create $GKE_CLUSTER

time gcloud container clusters create $GKE_CLUSTER \
    --num-nodes=3 \
    --machine-type=$GKE_VM_TYPE

time gcloud container clusters resize $GKE_CLUSTER \
    --num-nodes 5

time gcloud container clusters create $GKE_CLUSTER \
    --num-nodes=1 \
    --machine-type=$GKE_VM_TYPE \
    --enable-autoscaling --min-nodes=1 --max-nodes=5 \
    --disk-size=100 \
    --cluster-version=1.23.16-gke.2500

gcloud container clusters delete $GKE_CLUSTER

gcloud container clusters get-credentials $GKE_CLUSTER
~~~