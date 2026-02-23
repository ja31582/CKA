![alt text](image-17.png)
Są kompontnty jak CILIUM które byłky doinstalowywane do klastra i nie zostaną automatycznie zktualizowane. Przed upgradem należy sptawdzić czy nowa wersja k8s obsuguje stare cilium, (dotyczy to wszystkich dodaktowych komponentów np.    )

1. wykonaj snapshot `etcd`
2. zaktualzuj pakiett repozytorium dla nowej wersji k8s, (usuń wpis dla starej wersji repozytorium)
    ```sh
    nano /etc/apt/sources.list.d/kubernetes.list
    deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.34/deb/ /
    ```
3. 
---



1. Najpierw `kubeadm upgrade apply 1.33.0` - poleceie zaktulizuje control plain components (master), jak równeiż odnowi certyfikaty klastra (te z kołem zębatym
![alt text](image-18.png)   
1. kublet i kubectl były instalowane osobno dla tego komponenty te musze być rowniez aktualizowane osobno
2. drain node
3.  upgrade kubelet i kubectl
4.  kubectrl uncordone k8s-master

następnie należy zaktualizowac workery
1. upgrade kubeadm
2. drain node
3. upgrade kubelet
4. uncordone node 
