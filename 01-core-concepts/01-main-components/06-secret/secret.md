---
title: "Secret"
linkTitle: "Secret"
weight: 11
version: 1.0
type: "docs"
description: >
---

### secret

![](../03-configmap/cm$secret.png)

Secret jest takim samym komponentem jak ConfigMap ale słuzy do przechowywania danych tajnych jak użytkownik, hasło, certyfikat.

Dane przechowywane w postaci **based64** (to nie jest szyfrowanie, to jest jedynie format)

![read](../06-secret/secret.png)

Dane mona w atry sposób zdeszyfrować 

```bash
echo "cGFzc3dvcmQ=" | base64 --decode
```