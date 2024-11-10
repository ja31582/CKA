#!/bin/bash

namespace='www'
service_yaml='www-svc-cip.yaml'
service_np_yaml='www-svc-np.yaml'
service_lb_yaml='www-svc-ls.yaml'
deployment_yaml='www-deployment.yaml'


kubectl create namespace $namespace

kubectl create service clusterip nginx-run --namespace $namespace --tcp 8080:80 --dry-run=client -o yaml > $service_yaml
kubectl create service nodeport nginx-run --namespace www --tcp 8080:80 --node-port=30001  --dry-run=client -o yaml > $service_np_yaml

# nie dizała z nodePort, nalezy wedytowac plik i dodac ręcznie
# LB - należy go utowrzyć ręcznie dla EC2, dla EKS towrzony jest automatycznie
# każdy service w klastrze musi mieć odręny LB
kubectl create service loadbalancer nginx-run  \
    --tcp=8080:80 --namespace=www \
    --dry-run=client -o yaml > $service_lb_yaml

kubectl create deployment nginx-run --image=nginx:1.24 --namespace $namespace --port=80 --replicas=2 --dry-run=client -o yaml > $deployment_yaml

#------------------------------------
kubectl apply -f $service_yaml
kubectl apply -f $deployment_np_yaml

pod=$(kubectl get po -n $namespace -l app=nginx-run --no-headers | awk '{print $1}' | head -1)
kubectl exec -n $namespace $pod -- curl nginx-run:8080 