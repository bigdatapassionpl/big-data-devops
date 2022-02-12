
* https://superset.apache.org/docs/installation/running-on-kubernetes

~~~shell
export HELM_REPO_NAME=superset
export HELM_REPO_URL=https://apache.github.io/superset
export HELM_CHART=superset/superset

helm get notes superset -n superset > superset/note.txt
  
helm delete superset --namespace superset
~~~