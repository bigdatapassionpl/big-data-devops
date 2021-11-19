
* https://cloud.google.com/sdk/gcloud/reference/projects

~~~
export REGION=europe-central2
export ZONE=europe-central2-a
export PROJECT_ID=

gcloud projects list

gcloud config set project PROJECT_ID

gcloud config set dataproc/region $REGION
gcloud config set compute/region $REGION

gcloud config get-value project
gcloud config get-value dataproc/region
gcloud config get-value compute/region
~~