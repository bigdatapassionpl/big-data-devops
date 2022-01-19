

* https://minikube.sigs.k8s.io/docs/start/
* 

~~~
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

minikube version
-- minikube version: v1.24.0
-- commit: 76b94fb3c4e8ac5062daf70d60cf03ddcc0a741b
kubectl version -o json

minikube start
minikube status
minikube stop
-- minikube delete

minikube ssh

minikube dashboard
minikube dashboard --url

minikube addons list
~~~