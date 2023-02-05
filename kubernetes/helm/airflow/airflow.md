
* https://airflow.apache.org/docs/helm-chart/stable/index.html

~~~shell

kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow
kubectl port-forward svc/airflow-flower 5555:5555 --namespace airflow
# http://34.118.81.196:8080/home
# admin/admin

kubectl apply -f airflow/spark-rbac.yaml

export pod=airflow-webserver-68844b4588-smz2n
kubectl cp airflow/dags/example_spark_kubernetes.py airflow/$pod:/opt/airflow/dags/ -c webserver
kubectl cp airflow/dags/example_spark_kubernetes_spark_pi.yaml airflow/$pod:/opt/airflow/dags/ -c webserver
~~~