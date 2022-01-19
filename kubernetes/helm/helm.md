

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
helm repo update
helm search repo jupyterhub
helm list -aA
helm history jupyterhub -n jupyterhub

helm get all jupyterhub -n jupyterhub
helm get notes jupyterhub -n jupyterhub
helm get hooks jupyterhub -n jupyterhub
helm get values jupyterhub -n jupyterhub
helm get values --all jupyterhub -n jupyterhub
helm get manifest jupyterhub -n jupyterhub
~~~