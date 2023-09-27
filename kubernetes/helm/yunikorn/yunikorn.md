
~~~shell
curl -o yunikorn/queues.yaml https://github.com/apache/yunikorn-k8shim/blob/master/deployments/examples/namespace/queues.yaml

kubectl port-forward svc/yunikorn-service 9889:9889 -n yunikorn

kubectl apply -f yunikorn/spark/yunikorn-spark-ns.yaml
kubectl apply -f yunikorn/spark/yunikorn-spark-role.yaml

~~~