
* https://github.com/minio/charts
* https://github.com/minio/minio/tree/master/helm/minio
* https://github.com/minio/operator/tree/master

~~~shell
kubectl port-forward svc/minio 9000:9000 --namespace minio

aws --endpoint-url http://localhost:9000 --profile minio s3 ls

alias aws="aws --profile minio --endpoint-url http://localhost:9000"

aws s3 ls
aws s3 mb s3://dremio
aws s3 ls
~~~

### MinIO Play
~~~shell
aws --endpoint-url https://play.min.io:9000 --profile minioplay s3 ls
aws --endpoint-url https://play.min.io:9000 --profile minioplay s3 mb s3://dremio --region us-east-1
aws --endpoint-url https://play.min.io:9000 --profile minioplay s3 ls | grep dremio
aws --endpoint-url https://play.min.io:9000 --profile minioplay s3 ls s3://dremio --recursive

aws --endpoint-url https://play.min.io:9000 --profile minioplay s3 rm s3://dremio --recursive
aws --endpoint-url https://play.min.io:9000 --profile minioplay s3 rb s3://dremio --force
~~~