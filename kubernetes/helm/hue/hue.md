
* https://gethue.com/hue-in-kubernetes/

~~~shell
helm repo add gethue https://helm.gethue.com

helm repo update
helm search repo gethue

helm show values gethue/hue > hue/values-default.yaml

time helm upgrade hue gethue/hue \
  --install \
  --timeout 10m \
  --cleanup-on-fail \
  --create-namespace \
  --namespace hue \
  --values hue/values.yaml
  
helm get notes hue -n hue > hue/note.txt

helm delete hue
~~~