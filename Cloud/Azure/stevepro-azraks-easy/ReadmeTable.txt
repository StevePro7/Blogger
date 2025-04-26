# 01 create RG stevepro-azraks-rg
<br />
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az group create --location northeurope --name stevepro-azraks-rg
</pre>
</td></tr>
</table>
<br />


# 02 create ~/stevepro-azraks/
<br>
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;az aks create                                   \
&nbsp;&nbsp;    --resource-group stevepro-azraks-rg         \
&nbsp;&nbsp;	--name stevepro-azraks                      \
&nbsp;&nbsp;    --node-count 1                              \
&nbsp;&nbsp;    --ssh-key-value ~/.ssh/master_ssh_key.pub
</pre>
</td></tr>
</table>
<br />
