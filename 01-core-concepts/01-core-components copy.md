---
title: "Note"
linkTitle: "note"
weight: 11
version: 1.0
type: "docs"
description: >
---



Jeśli nod nie ma wystarczających zasobów, to aby uratować klaster, k8s pozbywa się podów (eviced - wysiedlic, wyrzucić). K8s na samym początku usówane są pody kóre nie mają zdefiniowanych zasobów - resources (limits/requirements)

Inspekcja zasobów przydzielonych dla podów 
```bash
kubectl get pods -n namespace -o jsonpath='{range .items[*]}{.metadata.name} {.spec.containers[*].resources}{"\n"}'
```

lub
```bash
kubectl get pods -o custom-columns=POD:.metadata.name,RESOURCES:.spec.containers[*].resources
```