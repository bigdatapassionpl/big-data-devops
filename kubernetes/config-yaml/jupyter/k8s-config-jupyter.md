
* https://kubernetes.io/docs/reference/kubernetes-api/
* https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
* https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
* https://kubernetes.io/docs/concepts/workloads/pods/
* https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
* https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
* https://kubernetes.io/docs/concepts/services-networking/service/

~~~shell
export githubrepo=https://raw.githubusercontent.com/bigdatapassionpl/big-data-devops/master/kubernetes/config-yaml/jupyter

kubectl apply -f $githubrepo/jupyter-namespace.yaml
kubectl apply -f $githubrepo/jupyter-pod.yaml
kubectl apply -f $githubrepo/jupyter-replicaset.yaml
kubectl apply -f $githubrepo/jupyter-deployment.yaml
kubectl apply -f $githubrepo/jupyter-service.yaml

kubectl delete -f $githubrepo/jupyter-service.yaml
kubectl delete -f $githubrepo/jupyter-deployment.yaml
kubectl delete -f $githubrepo/jupyter-replicaset.yaml
kubectl delete -f $githubrepo/jupyter-pod.yaml
kubectl delete -f $githubrepo/jupyter-namespace.yaml
~~~