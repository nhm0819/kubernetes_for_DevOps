# kubernetes_for_DevOps


## minikube 사용하기
```
minikube start \
    --network-plugin=cni \
    --enable-default-cni \
    --cni calico \
    --nodes 3 \
    --cpus 4 \
    --memory 8g \
    --bootstrapper=kubeadm \

```


## kubeadm 사용하기

