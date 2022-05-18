
* https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html
* https://eksctl.io
* https://github.com/weaveworks/eksctl
* https://docs.aws.amazon.com/eks/latest/userguide/troubleshooting_iam.html#security-iam-troubleshoot-cannot-view-nodes-or-workloads

~~~shell
export CLUSTER=bigdatapassion

time eksctl create cluster --name $CLUSTER

time eksctl create cluster \
  --name $CLUSTER \
  --region $AWS_REGION \
  --nodes=2

time eksctl create cluster \
  --name $CLUSTER \
  --region $AWS_REGION \
  --nodes=3 \
  --without-nodegroup

time eksctl create cluster \
  --name $CLUSTER \
  --region $AWS_REGION \
  --fargate

time eksctl create cluster \
  --name=$CLUSTER \
  --nodes-min=3 \
  --nodes-max=5
  
eksctl utils describe-stacks --region=us-east-1 --cluster=$CLUSTER

eksctl delete cluster $CLUSTER
~~~

~~~shell
eksctl create cluster -f cluster.yaml
eksctl delete cluster -f cluster.yaml
~~~


~~~shell
eksctl get iamidentitymapping \
  --cluster $CLUSTER \
  --region=$AWS_REGION

eksctl create iamidentitymapping \
  --cluster $CLUSTER \
  --region=$AWS_REGION \
  --arn arn:aws:iam::689298090607:role/LabRole \
  --group system:masters \
  --username admin
~~~


~~~shell

aws eks create-cluster \
   --region $AWS_REGION \
   --name my-cluster \
   --kubernetes-version 1.22 \
   --role-arn arn:aws:iam::689298090607:role/LabRole \
   --resources-vpc-config subnetIds=subnet-00c88461fc1c007c4,subnet-0259df5dd48da7134,securityGroupIds=sg-084ae776fb1403ff4
~~~