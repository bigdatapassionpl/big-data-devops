

~~~
gcloud compute networks list
gcloud compute networks delete NAME

gcloud compute firewall-rules list 
gcloud compute firewall-rules delete NAME

gcloud compute networks subnets list
gcloud compute networks subnets delete NAME
~~~


~~~
export REGION=europe-central2
export ZONE=europe-central2-a
export INSTANCE=nifi-vm

gcloud compute instances list
gcloud compute machine-types list --zones $ZONE

gcloud compute ssh <instance_name>
~~~