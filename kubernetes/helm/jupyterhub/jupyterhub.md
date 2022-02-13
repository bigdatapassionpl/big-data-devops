
* https://jupyterhub.github.io/helm-chart/
* https://zero-to-jupyterhub.readthedocs.io/en/latest/
* https://github.com/jupyterhub/helm-chart
* https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html
* 

~~~shell
export HELM_REPO_NAME=jupyterhub
export HELM_REPO_URL=https://jupyterhub.github.io/helm-chart/
export HELM_CHART=jupyterhub/jupyterhub
export HELM_CHART_VERSION=1.1.3-n313.h2d03a133
#export HELM_CHART_VERSION=1.2.0

kubectl --namespace=jupyterhub port-forward service/proxy-public 8080:http
~~~

### Images
~~~shell
export JUPYTER_DOCKER_VERSION=2022-02-12

docker pull jupyter/minimal-notebook:$JUPYTER_DOCKER_VERSION
docker pull jupyter/scipy-notebook:$JUPYTER_DOCKER_VERSION
docker pull jupyter/r-notebook:$JUPYTER_DOCKER_VERSION
docker pull jupyter/tensorflow-notebook:$JUPYTER_DOCKER_VERSION
docker pull jupyter/datascience-notebook:$JUPYTER_DOCKER_VERSION
docker pull jupyter/pyspark-notebook:$JUPYTER_DOCKER_VERSION
docker pull jupyter/all-spark-notebook:$JUPYTER_DOCKER_VERSION
~~~