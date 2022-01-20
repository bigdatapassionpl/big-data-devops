
* https://jupyterhub.github.io/helm-chart/
* https://zero-to-jupyterhub.readthedocs.io/en/latest/
* https://github.com/jupyterhub/helm-chart
* 

~~~
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/

helm repo update
helm search repo jupyterhub

export JUPYTER_HUB_HELM_VERSION=1.1.3-n263.hfafb144a

time helm upgrade jupyterhub jupyterhub/jupyterhub \
  --install \
  --create-namespace \
  --cleanup-on-fail \
  --namespace jupyterhub \
  --version=$JUPYTER_HUB_HELM_VERSION \
  --values jupyterhub/config.yaml

time helm upgrade jupyterhub jupyterhub/jupyterhub \
  --cleanup-on-fail \
  --namespace jupyterhub \
  --version=$JUPYTER_HUB_HELM_VERSION \
  --values jupyterhub/config.yaml

helm delete jupyterhub --namespace jupyterhub
~~~