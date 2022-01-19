
* https://airflow.apache.org/docs/helm-chart/stable/index.html

~~~
helm repo add apache-airflow https://airflow.apache.org

helm repo update
helm search repo apache-airflow

time helm upgrade airflow apache-airflow/airflow \
  --install \
  --create-namespace \
  --cleanup-on-fail \
  --namespace airflow

helm upgrade airflow apache-airflow/airflow --namespace airflow

helm delete airflow --namespace airflow
~~~