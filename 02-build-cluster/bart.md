---
title: "install steps - additions"
linkTitle: "Install steps - additions"
weight: 11
version: 1.0
type: "docs"
description: >
---

Zestaw skryptów umożliwiający stworzemoe klastra k8s.
wykożystywany przy budowie klastra do pracy dyplomowej Bartka

--kubectl Cheat Sheet--
https://kubernetes.io/docs/reference/kubectl/cheatsheet/

--prerequisite--

#Update
apt update; apt upgrade -y;  apt autoclean -y

#rename the servers master - there is no needet to rename worker servers.
sudo hostnamectl set-hostname "k8s-master.v-it.pl"
exec bash

#configure ETH - on-premis
nano /etc/netplan/00-installer-config.yaml
--
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      addresses:
        - 10.0.0.120/24
      routes:
        - to: default
          via: 10.0.0.1
      nameservers:
          search: [v-it.pl]
          addresses: [10.0.0.1, 1.1.1.1]
--
netplan apply


#Add the following entries in /etc/hosts file on each node
echo "10.0.22.220 k8s-master.v-it.pl k8s-master" >>/etc/hosts
----------------------------------
https://www.linuxtechi.com/install-kubernetes-on-ubuntu-22-04/

#turn off swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

#sudo sysctl --system

#Install containerd run time
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

#Enable docker repository
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# install container
sudo apt update
sudo apt install -y containerd.io

#Configure containerd so that it starts using systemd as cgroup.
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

#Restart and enable containerd service
sudo systemctl restart containerd
sudo systemctl enable containerd
sudo systemctl status containerd

#Add apt repository for Kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

#Install Kubernetes components Kubectl, kubeadm & kubelet
sudo apt update
sudo apt install -y kubelet kubeadm kubectl --allow-change-held-packages
sudo apt-mark hold kubelet kubeadm kubectl

#MASTER - intialize Kubernetes cluster with Kubeadm command	
#rename the servers (master, worker1, worker2)
sudo hostnamectl set-hostname "k8s-master.v-it.pl"
exec bash

#check ip address of k8s-master and add info in hosts file
echo "10.0.23.147 k8s-master.v-it.pl k8s-master" >> /etc/hosts	


sudo kubeadm init --control-plane-endpoint=10.20.30.27


######## where the tokens are stored ????????   --> kubeadm token list  #kubeadm token create --print-join-command
You can now join any number of control-plane nodes by copying certificate authorities
and service account keys on each node and then running the following as root:

  kubeadm join k8s-master.bpsc.com.pl:6443 --token hkaxim.fpurkm2m247v8jvq \
        --discovery-token-ca-cert-hash sha256:dd14414b761226f1ea294cfce4256c1d8f2e1d629925543df0c01cdcb55d0ec3 \
        --control-plane

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join k8s-master.bpsc.com.pl:6443 --token hkaxim.fpurkm2m247v8jvq \
        --discovery-token-ca-cert-hash sha256:dd14414b761226f1ea294cfce4256c1d8f2e1d629925543df0c01cdcb55d0ec3
########


################ go to --> https://docs.tigera.io/calico/3.25/getting-started/kubernetes/quickstart




mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl cluster-info
kubectl get nodes

#Install Calico Pod Network Add-on (master)
curl https://projectcalico.docs.tigera.io/manifests/calico.yaml -O
kubectl apply -f calico.yaml

#veryfy
kubectl get pods -n kube-system



#deploy new worker nodes using AMI and UserData

	#!/bin/bash
	sudo hostnamectl set-hostname "k8s-worker.v-it.pl"
	exec bash
	echo "10.0.19.192 k8s-master2.v-it.pl k8s-master" >> /etc/hosts	
kubeadm join k8s-master.v-it.pl:6443 --token x7s555.9oo9h50su9vinoyr --discovery-token-ca-cert-hash sha256:45ab35a5c4b18bb9ec686e512968f242075fcd1ced0c0c1392fbdc94a6e00242

----	


kubectl get nodes


###tet klastra###
{ clear && \
  echo -e "\n=== Kubernetes Status ===\n" && \
  kubectl get --raw '/healthz?verbose' && \
  kubectl version --short && \
  kubectl get nodes && \
  kubectl cluster-info; 
} | grep -z 'Ready\| ok\|passed\|running'





pv pvc
https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/


kubectl describe storageclasses.storage.k8s.io	
