Azure AKS
13-Apr-2025

Chat GPT
azure aks what is the minimal az aks create required to create an Azure AKS cluster?


az aks create \
  --resource-group <RESOURCE_GROUP_NAME> \
  --name <CLUSTER_NAME> \
  --node-count 1 \
  --generate-ssh-keys


Explanation of Required Parameters:
--resource-group: The name of the Azure Resource Group to create the cluster in. This group must already exist.

--name: The name of the AKS cluster.

--node-count: Number of nodes in the default node pool (1 is the minimum).

--generate-ssh-keys: Automatically generates SSH keys if none are provided.

🔑 You could also use --ssh-key-value instead of --generate-ssh-keys if you want to provide your own SSH public key.


i.e.
--ssh-key-value ~/.ssh/master_ssh_key.pub	



SUMMARY

az group create --name stevepro-azraks-rg --location northeurope --debug

az aks create \
  --resource-group stevepro-azraks-rg \
  --name stevepro-azraks  \
  --node-count 1 \
  --ssh-key-value ~/.ssh/master_ssh_key.pub	
  

az aks get-credentials --resource-group stevepro-azraks-rg --name stevepro-azraks
