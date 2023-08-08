
* https://github.com/minio/charts
* https://github.com/minio/minio/tree/master/helm/minio
* https://github.com/minio/operator/tree/master

~~~shell
kubectl port-forward svc/minio 9000:9000 --namespace minio

aws s3 ls --profile minio --endpoint-url http://localhost:9000

alias aws="aws --profile minio --endpoint-url http://localhost:9000"

aws s3 ls
aws s3 mb s3://dremio
aws s3 ls
~~~