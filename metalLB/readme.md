kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/main/manifests/metallb.yaml
kubectl apply -f metallb-config.yaml
kubectl get pods -n metallb-system
