

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
#export HELM_REPO_NAME=unknown
#export HELM_REPO_URL=unknown
#export HELM_CHART=unknown
#export HELM_CHART_VERSION=unknown

export HELM_DIR=$HELM_CHART
export HELM_NAMESPACE=$HELM_CHART
export HELM_RELEASE=$HELM_REPO_NAME

helm repo remove $HELM_REPO_NAME
helm repo add $HELM_REPO_NAME $HELM_REPO_URL
helm repo list
helm repo update

helm search repo $HELM_REPO_NAME
helm search repo $HELM_REPO_NAME --versions | head
helm search repo $HELM_REPO_NAME --versions --devel | head
#helm repo remove $HELM_REPO_NAME

helm show values $HELM_REPO_NAME/$HELM_CHART --version=$HELM_CHART_VERSION > $HELM_DIR/values-default.yaml

time helm upgrade $HELM_RELEASE $HELM_REPO_NAME/$HELM_CHART \
  --install \
  --timeout 10m \
  --cleanup-on-fail \
  --create-namespace \
  --namespace $HELM_NAMESPACE \
  --values $HELM_DIR/values.yaml \
  --version=$HELM_CHART_VERSION

helm list -aA

helm status $HELM_RELEASE
helm test $HELM_RELEASE
helm history $HELM_RELEASE

export HELM_REVISION=67
helm rollback $HELM_RELEASE $HELM_REVISION --namespace $HELM_NAMESPACE

helm get notes $HELM_RELEASE -n $HELM_NAMESPACE > $HELM_DIR/note.txt

helm get all jupyterhub -n $HELM_NAMESPACE
helm get notes jupyterhub -n $HELM_NAMESPACE
helm get hooks jupyterhub -n $HELM_NAMESPACE
helm get values jupyterhub -n $HELM_NAMESPACE
helm get values --all jupyterhub -n $HELM_NAMESPACE
helm get manifest jupyterhub -n $HELM_NAMESPACE


#helm delete $HELM_RELEASE
#helm uninstall $HELM_RELEASE
#kubectl delete ns $HELM_NAMESPACE
~~~