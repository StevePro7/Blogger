README table
23-Mar-2025


# 01	cluster YAML
create ~/stevepro-awseks/cluster.yaml
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;kind: ClusterConfig
&nbsp;&nbsp;apiVersion: eksctl.io/v1alpha5
&nbsp;&nbsp;metadata:
&nbsp;&nbsp;  name: stevepro-aws-eks
&nbsp;&nbsp;  region: eu-west-1
&nbsp;&nbsp;nodeGroups:
&nbsp;&nbsp;  - name: stevepro-aws-eks
&nbsp;&nbsp;    instanceType: m5.large
&nbsp;&nbsp;    desiredCapacity: 1
&nbsp;&nbsp;cloudWatch:
&nbsp;&nbsp;    clusterLogging:
&nbsp;&nbsp;      enableTypes: ["all"]
</pre>
</td></tr>
</table>
<br />


# 02	create cluster
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;eksctl create cluster -f ~/stevepro-awseks/cluster.yaml	\
&nbsp;    --kubeconfig ~/stevepro-awseks/kubeconfig			\
&nbsp;    --verbose 5
</pre>
</td></tr>
</table>
<br />


# 03	scale nodegroup
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;eksctl scale nodegroup	\
&nbsp;    --cluster=stevepro-aws-eks	\
&nbsp;    --name=stevepro-aws-eks	\
&nbsp;    --nodes=3			\
&nbsp;    --nodes-min=0		\
&nbsp;    --nodes-max=3		\
&nbsp;    --verbose 5
</pre>
</td></tr>
</table>
<br />


# 04 delete
kubectl delete -f Kubernetes.yaml
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;eksctl delete cluster		\
&nbsp;    --name=stevepro-aws-eks	\
&nbsp;    --region eu-west-1		\
&nbsp;    --force			\
&nbsp;    --parallel 10
</pre>
</td></tr>
</table>
<br />



ARCHIVE
eksctl create cluster -f ~/stevepro-awseks/cluster.yaml \
    --kubeconfig ~/stevepro-awseks/kubeconfig           \
    --verbose 5

