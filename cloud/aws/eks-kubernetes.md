
* https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html
* https://eksctl.io
* https://github.com/weaveworks/eksctl
* https://docs.aws.amazon.com/eks/latest/userguide/troubleshooting_iam.html#security-iam-troubleshoot-cannot-view-nodes-or-workloads

~~~shell
export CLUSTER=bigdatapassion

time eksctl create cluster --name $CLUSTER

time eksctl create cluster \
--name $CLUSTER \
--region eu-west-1 \
--nodes=3 \
--without-nodegroup

time eksctl create cluster \
--name $CLUSTER \
--region us-east-1 \
--fargate

eksctl create cluster --name=cluster-5 --nodes-min=3 --nodes-max=5

eksctl delete cluster $CLUSTER
~~~