
~~~shell
export githubrepourl=https://raw.githubusercontent.com/bigdatapassionpl/big-data-devops/master

kubectl apply -f $githubrepourl/kubernetes/config/jupyter/jupyter-namespace.yaml
kubectl apply -f $githubrepourl/kubernetes/config/jupyter/jupyter-pod.yaml

kubectl delete -f $githubrepourl/kubernetes/config/jupyter/jupyter-pod.yaml
kubectl delete -f $githubrepourl/kubernetes/config/jupyter/jupyter-namespace.yaml
~~~