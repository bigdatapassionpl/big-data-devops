
* https://jupyterhub.github.io/helm-chart/
* https://zero-to-jupyterhub.readthedocs.io/en/latest/
* https://github.com/jupyterhub/helm-chart
* 

~~~
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/

helm repo update
helm search repo jupyterhub
helm search repo jupyterhub/jupyterhub --versions
helm search repo jupyterhub/jupyterhub --versions --devel

export JUPYTER_HUB_HELM_VERSION=1.1.3-n263.hfafb144a

helm show values jupyterhub/jupyterhub \
    --version=$JUPYTER_HUB_HELM_VERSION \
    > jupyterhub/values-default.yaml

time helm upgrade jupyterhub jupyterhub/jupyterhub \
  --install \
  --timeout 10m \
  --cleanup-on-fail \
  --create-namespace \
  --namespace jupyterhub \
  --version=$JUPYTER_HUB_HELM_VERSION \
  --values jupyterhub/values.yaml

helm get notes jupyterhub -n jupyterhub > jupyterhub/note.txt

helm delete jupyterhub --namespace jupyterhub

kubectl delete ns jupyterhub
~~~