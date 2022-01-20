
* https://github.com/kubernetes/dashboard
* https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
* https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard

~~~shell

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml

~~~

~~~shell
# Add kubernetes-dashboard repository
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
# Deploy a Helm Release named "my-release" using the kubernetes-dashboard chart
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard
~~~