
* https://airflow.apache.org/docs/helm-chart/stable/index.html

~~~
kubectl create namespace airflow
helm repo add apache-airflow https://airflow.apache.org

helm install airflow apache-airflow/airflow --namespace airflow

helm upgrade airflow apache-airflow/airflow --namespace airflow

helm delete airflow --namespace airflow
~~~