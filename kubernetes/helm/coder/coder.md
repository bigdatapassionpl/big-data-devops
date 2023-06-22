
* https://coder.com/docs/v2/latest/install/kubernetes
* 


~~~shell
# Create a namespace for Coder
kubectl create namespace coder
kubectl create namespace coder-workspace

# Install PostgreSQL
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install coder-db bitnami/postgresql \
    --namespace coder \
    --set auth.username=coder \
    --set auth.password=coder \
    --set auth.database=coder \
    --set persistence.size=10Gi

# Create a secret with the database URL:
# Uses Bitnami PostgreSQL example. If you have another database,
# change to the proper URL.
kubectl create secret generic coder-db-url -n coder \
   --from-literal=url="postgres://coder:coder@coder-db-postgresql.coder.svc.cluster.local:5432/coder?sslmode=disable"

# Install coder
helm repo add coder-v2 https://helm.coder.com/v2

helm install coder coder-v2/coder \
    --namespace coder \
    --values /Users/radek/projects/bigdatapassion/big-data-devops/kubernetes/helm/coder-v2-coder/values.yaml

helm upgrade coder coder-v2/coder \
  --namespace coder \
  -f /Users/radek/projects/bigdatapassion/big-data-devops/kubernetes/helm/coder-v2-coder/values.yaml

kubectl apply -f coder-v2-coder/coder-sa.yaml

kubectl create clusterrolebinding coder-edit-role \
  --clusterrole=edit \
  --serviceaccount=coder:coder \
  --namespace=coder
~~~