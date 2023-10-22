---
title: "kubeconfig"
linkTitle: "kubeconfig"
weight: 11
version: 1.0
type: "docs"
description: >
---

Aby połaczyć się z klastrem użyj komendy
```bash
sudo kubectl get no --kubeconfig /etc/kubernetes/admin.conf
```

Możesz u żyć alternatywy, działa tylko dla sesji
```bash
sudo -i
export KUBECONFIG=/etc/kubernetes/admin.conf
```

Możesz przekopiowac plik do lokalizacji ~/.kube/config
```bash
sudo mkdir ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $(id --user):$(id --group) ~/.kube/config
```


/etc/kubernetes/admin.conf
```bash
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: xxx         # /etc/kubernetes/ca.cert - Base64-encoded string
    server: https://10.20.10.56:6443        # adres lokalny serwera na którym wystawiony jest API klastra
  name: kubernetes
contexts:                                   # kontekst używany do grupowania parametrów dostępu
- context:                                  # kubectl zawsze używa defaultowego kontekstu
    cluster: kubernetes                     # możesz mieś skonfigurowanych wiele kontekstów
    user: kubernetes-admin                  # ostatnio wybrany jest zawsze domyślnym
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config                                # świadczy o tym , że jest to plik konfiguracyjny
preferences: {}
users:
- name: kubernetes-admin                    # zdefiniowani użytkownicy mający dostęp do klastra
  user:                                     
    client-certificate-data: xxx            # poświadczenia użytkownika - klucz Base64-encoded 
    client-key-data: xxx                    # poświadczenia użytkownika - cert Base64-encoded 
```