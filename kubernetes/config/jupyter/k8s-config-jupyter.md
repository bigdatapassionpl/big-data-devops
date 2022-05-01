
* https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
* https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
* https://kubernetes.io/docs/concepts/workloads/pods/
* https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
* 

~~~shell
export githubrepourl=https://raw.githubusercontent.com/bigdatapassionpl/big-data-devops/master

kubectl apply -f $githubrepourl/kubernetes/config/jupyter/jupyter-namespace.yaml
kubectl apply -f $githubrepourl/kubernetes/config/jupyter/jupyter-pod.yaml
kubectl apply -f $githubrepourl/kubernetes/config/jupyter/jupyter-replicaset.yaml

kubectl delete -f $githubrepourl/kubernetes/config/jupyter/jupyter-replicaset.yaml
kubectl delete -f $githubrepourl/kubernetes/config/jupyter/jupyter-pod.yaml
kubectl delete -f $githubrepourl/kubernetes/config/jupyter/jupyter-namespace.yaml
~~~