

* https://helm.sh/docs/intro/quickstart/
* https://helm.sh/docs/topics/v2_v3_migration/
* 

### Helm install
~~~
# from source
cd ~/programs/helm
wget https://get.helm.sh/helm-v3.7.2-linux-amd64.tar.gz
tar -zxvf helm-v3.7.2-linux-amd64.tar.gz
~/programs/helm/linux-amd64/helm version

sudo mv linux-amd64/helm /usr/local/bin/helm
helm version

# from deb repo
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
~~~

### Helm basics
~~~
helm repo list
~~~

### Airflow
~~~
kubectl create namespace airflow
helm repo add apache-airflow https://airflow.apache.org
helm install airflow apache-airflow/airflow --namespace airflow
~~~