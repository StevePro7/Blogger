README table
23-Mar-2025


# 00	security principal
az login
az ad sp create-for-rbac --name ${USER}-sp --skip-assignment

OUTPUT
<pre style="font-size: 12px;">
&nbsp;{
&nbsp;    "appId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
&nbsp;    "displayName": "stevepro-sp",
&nbsp;    "name": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
&nbsp;    "password": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
&nbsp;    "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
&nbsp;}
</pre>

export AZ_SP_ID=<value_from_appId>
export AZ_SP_PASSWORD=<value_from_password>


# 01	create group
#az group create --name ${CLUSTER_NAME} --location ${AZ_LOCATION} --debug

<pre style="font-size: 12px;">
&nbsp;az group create --name stevepro-azraks --location northeurope --debug
</pre>


# 02	create cluster
<pre style="font-size: 12px;">
&nbsp;az aks create --name stevepro-azraks			\
&nbsp;    --resource-group stevepro-azraks			\
&nbsp;    --dns-name-prefix stevepro-azraks			\
&nbsp;    --node-count 3					\
&nbsp;    --node-vm-size Standard_D2s_v3			\
&nbsp;    --kubernetes-version 1.28				\
&nbsp;    --ssh-key-value ~/.ssh/master_ssh_key.pub		\
&nbsp;    --service-principal ${AZ_SP_ID}			\
&nbsp;    --client-secret ${AZ_SP_PASSWORD}			\
&nbsp;    --load-balancer-sku standard			\
&nbsp;    --network-plugin azure --debug
</pre>

