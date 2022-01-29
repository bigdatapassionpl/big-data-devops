
* https://airflow.apache.org/docs/helm-chart/stable/index.html

~~~
helm repo add airflow https://airflow.apache.org

helm repo update
helm search repo airflow

helm show values airflow/airflow > airflow/values-default.yaml

time helm upgrade airflow airflow/airflow \
  --install \
  --timeout 10m \
  --cleanup-on-fail \
  --create-namespace \
  --namespace airflow \
  --values airflow/values.yaml

helm get notes airflow -n airflow > airflow/note.txt
  
helm delete airflow --namespace airflow
~~~