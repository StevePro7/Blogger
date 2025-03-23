README table
23-Mar-2025


# 01	create cluster
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

