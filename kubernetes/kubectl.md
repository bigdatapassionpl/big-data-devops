

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
~~~

### Pods
~~~
kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml
kubectl apply -f kubernetes/basics/simple-pod.yaml

kubectl get pod
kubectl delete pod {name}

kubectl port-forward pod/tescik-7c8b6f564b-f5n9r 8181:80
~~~