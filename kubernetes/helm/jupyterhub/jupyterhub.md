
* https://jupyterhub.github.io/helm-chart/
* https://zero-to-jupyterhub.readthedocs.io/en/latest/
* https://github.com/jupyterhub/helm-chart
* 

~~~shell
export HELM_REPO_NAME=jupyterhub
export HELM_REPO_URL=https://jupyterhub.github.io/helm-chart/
export HELM_CHART=jupyterhub/jupyterhub
export HELM_CHART_VERSION=1.1.3-n313.h2d03a133
#export HELM_CHART_VERSION=1.2.0

kubectl --namespace=jupyterhub port-forward service/proxy-public 8080:http
~~~