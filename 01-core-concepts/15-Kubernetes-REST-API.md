Kubernetes REST API to centralny interfejs sterujący całym klastrem Kubernetes. Każda operacja w K8s — od utworzenia Poda po backup Velero — przechodzi przez to API.

Kubernetes REST API to HTTP/JSON API wystawione przez kube-apiserver, będące jedyną bramą do stanu klastra.

## Główne cechy Kubernetes REST API
- **Centralny punkt sterowania**: Wszystkie żądania dotyczące klastra Kubernetes są kierowane do kube-apiserver, który zarządza stanem klastra.


Dostęp do k8s endpoints, najprostrzy sposób na dostęp do k8s. Prawa są take jak zostąły ci przyznane w RBAC
```yaml
kubectl proxy --port=8081 &

curl http://localhost:8081/api/v1
curl http://localhost:8081/api/v1/namespaces
curl http://localhost:8081/api/v1/namespaces/kube-system/pods
curl http://localhost:8081/api/v1/nodes
```

do k8s API moża rówwnież dstać się