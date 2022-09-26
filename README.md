# ipfs-operator
## Installation
### 1. Setup DNS record
1. Point subdomain "ipfs" to the IP of loadbalancer.
### 2. Install IPFS
1. Install IPFS by Helm charts.
    ```
    make deploy
    ```
## IPFS Usage
### IPFS gateway
1. IPFS gateway is a public service for everyone is accessible. Here is the [Reference](https://docs.ipfs.tech/reference/http/gateway/#trusted-vs-trustless).
### IPFS API
1. IPFS API does not expose to public world. We can only access the service through private network. Here is the [Reference](https://docs.ipfs.tech/reference/kubo/rpc/)
### Local Development
1. Connect to k8s Cluster.
2. Use port-forward to connect the ipfs api service.
   ```
   kubectl port-forward svc/ipfs-ipfs 5001:5001
   ```
3. Start developing your app.
### Prod Env
1. Setup app env using internal ip: `http://ipfs-ipfs:5001`
