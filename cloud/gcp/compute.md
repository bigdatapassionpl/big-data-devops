
* https://gcpinstances.doit-intl.com/
* https://cloud.google.com/compute/docs/regions-zones
* 

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
gcloud compute instances list --format="json"
gcloud compute instances list --format="table(NAME,EXTERNAL_IP)"
gcloud compute instances list --format='get(networkInterfaces[0].accessConfigs[0].natIP)'

gcloud compute machine-types list --zones $ZONE

gcloud compute ssh <instance_name>

gcloud compute instances list --format='get(networkInterfaces[0].accessConfigs[0].natIP,name)' | sudo tee -a /etc/hosts  > /dev/null
ssh <host>

ssh-keygen -f "/home/radek/.ssh/known_hosts" -R "bigdatacluster-m"
ssh-keygen -f "/home/radek/.ssh/known_hosts" -R "34.118.82.206"
~~~