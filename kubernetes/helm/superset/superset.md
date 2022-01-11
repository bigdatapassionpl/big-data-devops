
~~~
helm repo add superset https://apache.github.io/superset
helm search repo superset

wget https://raw.githubusercontent.com/apache/superset/master/helm/superset/values.yaml -O values-default.yaml

helm upgrade --cleanup-on-fail \
  --install superset superset/superset \
  --namespace superset \
  --create-namespace \
  --values values-minikube.yaml
~~~