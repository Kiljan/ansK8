#!/bin/bash
# set up after init
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#add auto completion
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null

#Weave Net install
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml