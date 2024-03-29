

* https://minikube.sigs.k8s.io/docs/start/
* https://minikube.sigs.k8s.io/docs/

~~~
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

minikube version
-- minikube version: v1.24.0
-- commit: 76b94fb3c4e8ac5062daf70d60cf03ddcc0a741b

minikube --help

minikube start

export MINIKUBE_MEMORY=20480
export MINIKUBE_MEMORY=7959

time minikube start \
    --nodes=1 \
    --cpus='6' \
    --memory $MINIKUBE_MEMORY \
    --disk-size='75gb' \
    --container-runtime='docker' \
    --kubernetes-version=latest \
    --driver=virtualbox

minikube status
minikube stop
# minikube delete

minikube ssh

minikube dashboard
minikube dashboard --url

minikube addons list

minikube addons enable ingress
kubectl get pods -n ingress-nginx

~~~