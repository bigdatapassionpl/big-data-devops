
* https://superset.apache.org/docs/installation/running-on-kubernetes

~~~
helm repo add superset https://apache.github.io/superset

helm repo update
helm search repo superset

wget https://raw.githubusercontent.com/apache/superset/master/helm/superset/values.yaml -O values-default.yaml

time helm upgrade superset superset/superset \
  --install \
  --create-namespace \
  --cleanup-on-fail \
  --namespace superset \
  --values superset/values-minikube.yaml
  
helm delete superset --namespace superset
~~~