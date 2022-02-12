
* https://superset.apache.org/docs/installation/running-on-kubernetes

~~~shell
export HELM_REPO_NAME=superset
export HELM_REPO_URL=https://apache.github.io/superset
export HELM_CHART=superset/superset
export HELM_CHART_VERSION=0.5.8

kubectl port-forward svc/superset 8088:8088 --namespace superset
~~~