

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

### Helm commands
~~~shell
export HELM_REPO_NAME=superset
export HELM_REPO_URL=https://apache.github.io/superset
export HELM_CHART=superset/superset

export HELM_DIR=$HELM_REPO_NAME
export HELM_NAMESPACE=$HELM_REPO_NAME
export HELM_RELEASE=$HELM_REPO_NAME

helm repo add $HELM_REPO_NAME $HELM_REPO_URL
helm repo list
helm repo update
helm search repo $HELM_REPO_NAME
#helm repo remove $HELM_REPO_NAME

helm show values $HELM_CHART > $HELM_DIR/values-default.yaml

time helm upgrade $HELM_RELEASE $HELM_CHART \
  --install \
  --timeout 10m \
  --cleanup-on-fail \
  --create-namespace \
  --namespace $HELM_NAMESPACE \
  --values $HELM_DIR/values.yaml


helm list -aA
helm history jupyterhub -n jupyterhub

helm get all jupyterhub -n jupyterhub
helm get notes jupyterhub -n jupyterhub
helm get hooks jupyterhub -n jupyterhub
helm get values jupyterhub -n jupyterhub
helm get values --all jupyterhub -n jupyterhub
helm get manifest jupyterhub -n jupyterhub
~~~