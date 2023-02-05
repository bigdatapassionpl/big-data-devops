
* https://superset.apache.org/docs/installation/running-on-kubernetes

~~~shell

kubectl port-forward svc/superset 8088:8088 --namespace superset
# http://localhost:8088/
# http://34.116.180.253:8088/login/
# admin:admin
~~~