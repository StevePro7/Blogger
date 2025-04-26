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
<br />

export AZ_SP_ID=<value_from_appId>
export AZ_SP_PASSWORD=<value_from_password>


# 01	create group
#az group create --name ${CLUSTER_NAME} --location ${AZ_LOCATION} --debug

<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az group create --name stevepro-azraks --location northeurope --debug
</pre>
</td></tr>
</table>
<br />


# 02	create cluster
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az aks create --name stevepro-azraks			\
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
</td></tr>
</table>
<br />


# 03	delete cluster
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az aks delete --name stevepro-azraks			\
&nbsp;    --resource-group stevepro-azraks
</pre>
</td></tr>
</table>
<br />


IMPORTANT
Delete the resource group from portal.azure.com
OR
az aks delete --name <cluster-name> --resource-group <resource-group-name>
