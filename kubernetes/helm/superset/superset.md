
~~~
helm repo add superset https://apache.github.io/superset
helm search repo superset

wget https://raw.githubusercontent.com/apache/superset/master/helm/superset/values.yaml

helm upgrade --install --values my-values.yaml superset superset/superset
~~~