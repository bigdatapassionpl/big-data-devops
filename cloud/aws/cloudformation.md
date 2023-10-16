
~~~shell
aws cloudformation list-stacks
aws cloudformation list-stacks --query "StackSummaries[].StackName"
aws cloudformation delete-stack --stack-name eksctl-bigdatapassion-cluster
~~~