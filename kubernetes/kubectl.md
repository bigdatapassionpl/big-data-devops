

* https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
* https://kubernetes.io/docs/reference/kubectl/cheatsheet/
* https://kubernetes.io/docs/reference/kubectl/
* https://kubernetes.io/docs/tasks/tools/
* https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/

# The basics
~~~shell
kubectl --help

cat ~/.kube/config
kubectl config view

kubectl cluster-info
kubectl cluster-info dump

kubectl version
kubectl version --client
kubectl version -o json

kubectl get nodes

kubectl config get-contexts
kubectl config current-context
kubectl config use-context {my-cluster-name}

kubectl config set-context --current --namespace={namespace}

kubectl get all
kubectl get all -n {namespace}
kubectl get all --all-namespaces 
~~~

### Run image
~~~shell
export myappimage=apache/myapplication:0.10.1
export myappport=8080

export myappimage=jupyter/minimal-notebook
export myappport=8888

kubectl run myapplication \
  --image=$myappimage \
  --port=$myappport
  
kubectl describe pod myapplication

kubectl wait pods -n default -l run=myapplication --for condition=Ready --timeout=90s
  
kubectl logs pod/myapplication
kubectl logs -f pod/myapplication

kubectl port-forward pod/myapplication $myappport:$myappport

kubectl delete pod myapplication
~~~


### Namespaces
~~~shell
kubectl get namespaces
kubectl get namespaces -o yaml
kubectl create namespace {namespace}
kubectl delete ns {namespace}
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


### Deployment
~~~shell
kubectl logs deployment/<name-of-deployment> # logs of deployment
kubectl logs -f deployment/<name-of-deployment> # follow logs
kubectl describe deploy <name-of-deployment>
~~~


### Service Accounts
~~~shell
kubectl get serviceaccounts
kubectl get serviceaccounts -A
kubectl get serviceaccounts -n {namespace}
~~~