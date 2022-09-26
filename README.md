# ipfs-operator
## Installation
1. Create a new kubernetes cluster in DigitalOcean, and Connect to the cluster.
2. Install DigitalOcean loadbalancer and ingress-controller. Follow [Official Installation Guide](https://kubernetes.github.io/ingress-nginx/deploy/) for more information.
   ```
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo update
    kubectl create namespace ingress-nginx
    helm upgrade ingress-nginx ingress-nginx/ingress-nginx -f ./values-ingress-nginx.yaml -n ingress-nginx --install
    ```
3. Install Cert-manager.
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
4. Create auth secret for "ipfs-api" service. Check [Document](https://kubernetes.github.io/ingress-nginx/examples/auth/basic/) for more information.
   - Generate password file
     ```
     htpasswd -c auth ic3
     ```
   - Create secret in the kubernetes cluster.
     ```
     kubectl create secret generic ipfs-auth --from-file=auth
     ```
5. Once the loadbalancer is created, setup DNS record, and point subdomain "ipfs" and "ipfs-api" to the IP of the loadbalancer.
6. Install IPFS helm charts.
   ```
   make deploy
   ```
## IPFS Usage
### IPFS gateway
1. IPFS gateway is a public service for everyone is accessible. Here is the [Reference](https://docs.ipfs.tech/reference/http/gateway/#trusted-vs-trustless).
### IPFS API
1. IPFS API does not expose to public world. We can only access the service through private network. Here is the [Reference](https://docs.ipfs.tech/reference/kubo/rpc/)
