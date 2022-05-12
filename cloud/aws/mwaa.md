
* https://docs.aws.amazon.com/mwaa/latest/userguide/what-is-mwaa.html
* https://awscli.amazonaws.com/v2/documentation/api/latest/reference/mwaa/create-environment.html

~~~shell
aws mwaa create-environment \
  --execution-role-arn arn:aws:iam::689298090607:role/LabRole \
  --name bigdatapassionairflow \
  --source-bucket-arn arn:aws:s3:::airflowbucket1038401293 \
  --dag-s3-path s3://airflowbucket1038401293/dags \
  --network-configuration SubnetIds=subnet-00c88461fc1c007c4,subnet-0259df5dd48da7134,SecurityGroupIds=sg-084ae776fb1403ff4
~~~