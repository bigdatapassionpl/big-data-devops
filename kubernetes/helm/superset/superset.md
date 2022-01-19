
* https://superset.apache.org/docs/installation/running-on-kubernetes

~~~shell
helm repo add superset https://apache.github.io/superset

helm repo update
helm search repo superset

#wget https://raw.githubusercontent.com/apache/superset/master/helm/superset/values.yaml -O values-default.yaml
helm show values superset/superset > superset/values-default.yaml

time helm upgrade superset superset/superset \
  --install \
  --create-namespace \
  --cleanup-on-fail \
  --namespace superset \
  --values superset/values.yaml

helm get notes superset -n superset > superset/note.txt
  
helm delete superset --namespace superset
~~~