
* https://gethue.com/hue-in-kubernetes/

~~~shell
helm repo add gethue https://helm.gethue.com

helm repo update
helm search repo gethue

helm show values gethue/hue > hue/values-default.yaml

helm install hue gethue/hue
~~~