
* https://spark.apache.org/docs/latest/running-on-kubernetes.html

~~~shell
kubectl apply -f spark-operator/jobs/spark-pi.yaml

kubectl get sparkapplications --all-namespaces

kubectl get sparkapplications spark-pi -n spark-operator
kubectl get sparkapplications spark-pi -o=yaml -n spark-operator

kubectl describe sparkapplication spark-pi -n spark-operator
kubectl delete sparkapplication spark-pi -n spark-operator
~~~