
* https://github.com/trinodb/charts

~~~shell

# http://34.118.96.186:8080/

kubectl edit configmap trino-worker -n trino
# query.max-total-memory-per-node

kubectl port-forward svc/trino 8080:8080 --namespace trino
~~~