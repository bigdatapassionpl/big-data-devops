

* https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
* https://kubernetes.io/docs/reference/kubectl/cheatsheet/

~~~
cat ~/.kube/config
kubectl config view

kubectl cluster-info
kubectl cluster-info dump

kubectl version
kubectl version --client

kubectl get nodes

kubectl config get-contexts
kubectl config current-context
kubectl config use-context {my-cluster-name}
kubectl config set-context --current --namespace={namespace}

kubectl get all
kubectl get all -n {namespace}
kubectl get all --all-namespaces 
~~~

### Service Accounts
~~~shell
kubectl get serviceaccounts
~~~

### Namespaces
~~~shell
kubectl get namespaces
kubectl get namespaces -o yaml
kubectl create namespace {namespace}
kubectl delete ns {namespace}
~~~

### Deployment
~~~shell
kubectl logs deployment/<name-of-deployment> # logs of deployment
kubectl logs -f deployment/<name-of-deployment> # follow logs
kubectl describe deploy <name-of-deployment>
~~~

### Pods
~~~shell
kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml
kubectl apply -f kubernetes/basics/simple-pod.yaml

kubectl get pod
kubectl get pods --all-namespaces 
kubectl delete pod {name}

kubectl port-forward pod/tescik-7c8b6f564b-f5n9r 8181:80
kubectl port-forward svc/hue-balancer 8080:80 --namespace hue

kubectl get svc --all-namespaces 
~~~