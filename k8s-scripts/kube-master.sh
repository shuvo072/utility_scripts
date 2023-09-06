echo "***********************"
echo "STEP 1 : ENABLE KUBELET"
echo "***********************"
lsmod | grep br_netfilter
sudo systemctl enable kubelet

echo "******************************"
echo "STEP 2 : PULL CONTAINER IMAGES"
echo "******************************"
sudo kubeadm config images pull

echo "**********************************************"
echo "STEP 3 : BOOTSTRAPING KUBERNETES CONTROL PLANE"
echo "**********************************************"
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

echo "**********************************************"
echo "STEP 4 : ADD CONFIG TO KUBECONFIG"
echo "**********************************************"
#mkdir -p $HOME/.kube
#sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
#sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "*****************************************"
echo "STEP 5 : INSTALL WEAVE NET NETWORK PLUGIN"
echo "*****************************************"
#kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
