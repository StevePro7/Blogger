AZR AKS
17-Mar-2025

PROCESS
cd
mkdir -p stevepro-azraks


Master SSH Key
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -N '' -f master_ssh_key
eval $(ssh-agent -s)
ssh-add master_ssh_key


PreReqs
az login


Check resources
az account list --output table
az group list --output table
az resource list --output table
az resource list --query "[?location=='northeurope']" --output table
az vm list --output table
az aks list --output table
az container list --output table
az storage account list --output table
az network public-ip list --output table


00 create resource group
az group create --name stevepro-azraks-rg --location northeurope --debug


00 create security principal
az ad sp create-for-rbac --name ${USER}-sp --skip-assignment


01 OUTPUT
{
    "appId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
    "displayName": "stevepro-sp",
    "name": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
    "password": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
    "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
}


01 EXPORT
export AZ_SP_ID=<value_from_appId>
export AZ_SP_PASSWORD=<value_from_password>

02 create cluster
az aks create --name stevepro-azraks            \
    --resource-group stevepro-azraks-rg         \
    --dns-name-prefix stevepro-azraks           \
    --node-count 3                              \
    --node-vm-size Standard_D2s_v3              \
    --kubernetes-version 1.28                   \
    --ssh-key-value ~/.ssh/master_ssh_key.pub   \
    --service-principal ${AZ_SP_ID}             \
    --client-secret ${AZ_SP_PASSWORD}           \
    --load-balancer-sku standard                \
    --network-plugin azure --debug


03 get credentials
export KUBECONFIG=~/.kube/config
az aks get-credentials --name stevepro-azraks   \
	--resource-group stevepro-azraks-rg --file ${KUBECONFIG}

COMMAND #03 DeployTest
mkdir -p ~/GitHub/luksa
cd ~/GitHub/luksa
git clone https://github.com/luksa/kubectl-plugins.git
cd kubectl-plugins
chmod +x kubectl-ssh
kubectl get nodes
./kubectl-ssh node TODO-get-AKS-node

COMMAND #05 Cleanup
kubectl delete -f Kubernetes.yaml
kubectl delete ns test-ns

05 delete cluster
az aks delete --name stevepro-azraks            \
    --resource-group stevepro-azraks