README table
23-Mar-2025


Master SSH Key
<table border="1" width="99%">
<tr>
<td valign="top" width="60%">
&nbsp;cd ~/.ssh<br />
&nbsp;ssh-keygen -t rsa -b 4096 -N '' -f master_ssh_key<br />
</td>
<td>
&nbsp;eval $(ssh-agent -s)<br />
&nbsp;ssh-add master_ssh_key<br />
</td>
</tr>
</table>
<br />
<br />

Pre-Requisites
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az login
</pre>
</td></tr>
</table>
<br />


Check resources
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az account list --output table
&nbsp;&nbsp;az group list --output table
&nbsp;&nbsp;az resource list --output table
&nbsp;&nbsp;az resource list --query "[?location=='northeurope']" --output table
&nbsp;&nbsp;az vm list --output table
&nbsp;&nbsp;az aks list --output table
&nbsp;&nbsp;az container list --output table
&nbsp;&nbsp;az storage account list --output table
&nbsp;&nbsp;az network public-ip list --output table
</pre>
</td></tr>
</table>
<br />

00 create resource group
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az group create --name stevepro-azraks-rg --location northeurope --debug
</pre>
</td></tr>
</table>
<br />

00 create security principal
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az ad sp create-for-rbac --name ${USER}-sp --skip-assignment
</pre>
</td></tr>
</table>
<br />

01 OUTPUT
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;{
&nbsp;    "appId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
&nbsp;    "displayName": "stevepro-sp",
&nbsp;    "name": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
&nbsp;    "password": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
&nbsp;    "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
&nbsp;}
</pre>
</td></tr>
</table>
<br />

01 EXPORT
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;export AZ_SP_ID=<value_from_appId>
&nbsp;export AZ_SP_PASSWORD=<value_from_password>
</pre>
</td></tr>
</table>
<br />
export AZ_SP_ID=<value_from_appId>
export AZ_SP_PASSWORD=<value_from_password>


# 02	create cluster
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az aks create --name stevepro-azraks            \
&nbsp;    --resource-group stevepro-azraks-rg               \
&nbsp;    --dns-name-prefix stevepro-azraks                 \
&nbsp;    --node-count 3                                    \
&nbsp;    --node-vm-size Standard_D2s_v3                    \
&nbsp;    --kubernetes-version 1.28                         \
&nbsp;    --ssh-key-value ~/.ssh/master_ssh_key.pub         \
&nbsp;    --service-principal ${AZ_SP_ID}                   \
&nbsp;    --client-secret ${AZ_SP_PASSWORD}                 \
&nbsp;    --load-balancer-sku standard                      \
&nbsp;    --network-plugin azure --debug
</pre>
</td></tr>
</table>
<br />


# 05	delete cluster
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az aks delete --name stevepro-azraks            \
&nbsp;    --resource-group stevepro-azraks-rg
</pre>
</td></tr>
</table>
<br />


IMPORTANT
Delete the resource group from portal.azure.com
OR
az aks delete --name <cluster-name> --resource-group <resource-group-name>
