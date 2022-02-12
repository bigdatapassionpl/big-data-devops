
* https://airflow.apache.org/docs/helm-chart/stable/index.html

~~~
export HELM_REPO_NAME=airflow
export HELM_REPO_URL=https://airflow.apache.org
export HELM_CHART=airflow/airflow
export HELM_CHART_VERSION=1.4.0

kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow
kubectl port-forward svc/airflow-flower 5555:5555 --namespace airflow
~~~