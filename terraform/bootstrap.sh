#!/bin/bash
set -e

# 1. Initialize Kubernetes control plane
kubeadm init --pod-network-cidr=10.244.0.0/16

# 2. Configure kubectl for ubuntu user
mkdir -p /home/ubuntu/.kube
cp -i /etc/kubernetes/admin.conf /home/ubuntu/.kube/config
chown ubuntu:ubuntu /home/ubuntu/.kube/config

# 3. Deploy Weave CNI
su - ubuntu -c "kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml"

# 4. Remove the control-plane taint so pods can schedule on master
NODE_NAME=$(kubectl get nodes -o name | cut -d/ -f2)
kubectl taint node $NODE_NAME node-role.kubernetes.io/control-plane:NoSchedule- || true
