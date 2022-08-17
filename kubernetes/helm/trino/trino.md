
* https://github.com/trinodb/charts

~~~shell
export HELM_REPO_NAME=trino
export HELM_REPO_URL=https://trinodb.github.io/charts/
export HELM_CHART=trino/trino
export HELM_CHART_VERSION=0.8.0

kubectl edit configmap trino-worker -n trino
# query.max-total-memory-per-node

kubectl port-forward svc/trino 8080:8080 --namespace trino
~~~