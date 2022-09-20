# ipfs-operator
## 1. Install ingress
1. Follow [Official Installation Guide](https://kubernetes.github.io/ingress-nginx/deploy/) for more information.
    ```
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo update
    kubectl create namespace ingress-nginx
    helm upgrade ingress-nginx ingress-nginx/ingress-nginx -f ./values-ingress-nginx.yaml -n ingress-nginx --install
    ```
2. [Config File](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/annotations.md)
## 2. Setup DNS record
1. Point subdomain "ipfs" and "ipfs-api" to the IP of loadbalancer.
## 3. Install cert-manager
1. Install commands.
    ```
    kubectl create namespace cert-manager
    helm repo add jetstack https://charts.jetstack.io
    helm repo update
    helm install \
      cert-manager jetstack/cert-manager \
      --namespace cert-manager \
      --create-namespace \
      --version v1.9.1 \
      --set installCRDs=true
    ```
## 4. Setup Cluster Ingress
1. Install Helm charts.
    ```
    make deploy
    ```
## 5. Install IPFS Cluster
1. Clone the repo - [IPFS-Cluster Helm Repo](https://github.com/TingSyuanWang/helm-ipfs-cluster)
2. Install ipfs.
   ```
   helm upgrade ipfs . --install --atomic
   ```
