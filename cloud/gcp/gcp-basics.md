
* https://cloud.google.com/sdk/gcloud/reference/projects

~~~shell
export GCP_REGION=europe-central2
export GCP_ZONE=europe-central2-a
export GCP_PROJECT_ID=bigdataworkshops

gcloud projects list

gcloud config set project $GCP_PROJECT_ID
gcloud config set dataproc/region $GCP_REGION
gcloud config set compute/region $GCP_REGION

gcloud config get-value project
gcloud config get-value dataproc/region
gcloud config get-value compute/region
~~