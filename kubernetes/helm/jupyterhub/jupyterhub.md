
~~~
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update

export JUPYTER_HUB_HELM_VERSION=1.1.3-n263.hfafb144a

helm upgrade --cleanup-on-fail \
  --install jupyterhub jupyterhub/jupyterhub \
  --namespace jupyterhub \
  --create-namespace \
  --version=$JUPYTER_HUB_HELM_VERSION \
  --values config.yaml

helm upgrade --cleanup-on-fail \
  jupyterhub jupyterhub/jupyterhub \
  --namespace jupyterhub \
  --version=$JUPYTER_HUB_HELM_VERSION \
  --values config.yaml
~~~