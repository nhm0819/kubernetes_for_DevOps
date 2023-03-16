# kubernetes_for_DevOps


## minikube 사용하기
```
minikube start \
    --network-plugin=cni \
    --enable-default-cni \
    --container-runtime=containerd \
    --bootstrapper=kubeadm \
    --nodes 3 \
    --cpus 4 \
    --memory 8g \
    --cni calico
```
