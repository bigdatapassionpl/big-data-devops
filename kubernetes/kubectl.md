

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

### Namespaces
~~~
kubectl get namespaces
kubectl get namespaces -o yaml
kubectl create namespace {namespace}
kubectl delete ns {namespace}
~~~

### Pods
~~~
kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml
kubectl apply -f kubernetes/basics/simple-pod.yaml

kubectl get pod
kubectl get pods --all-namespaces 
kubectl delete pod {name}

kubectl port-forward pod/tescik-7c8b6f564b-f5n9r 8181:80
~~~