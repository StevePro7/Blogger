README table
23-Mar-2025


# 01	create cluster

<pre style="font-size: 12px;">
&nbsp;az aks create --name stevepro-azraks			\
&nbsp;    --resource-group stevepro-azraks			\
&nbsp;    --dns-name-prefix stevepro-azraks			\

&nbsp;    --verbose 5
&nbsp;    --verbose 5
&nbsp;    --verbose 5
&nbsp;    --verbose 5
&nbsp;    --verbose 5
&nbsp;    --verbose 5
&nbsp;    --verbose 5
&nbsp;    --verbose 5&nbsp;    --verbose 5
</pre>

eksctl create cluster -f ~/stevepro-awseks/cluster.yaml \
    --kubeconfig ~/stevepro-awseks/kubeconfig           \
    --verbose 5


# 03	scale nodegroup
<pre style="font-size: 12px;">
&nbsp;eksctl scale nodegroup          \
&nbsp;    --cluster=stevepro-aws-eks  \
&nbsp;    --name=stevepro-aws-eks     \
&nbsp;    --nodes=3                   \
&nbsp;    --nodes-min=0               \
&nbsp;    --nodes-max=3               \
&nbsp;    --verbose 5
</pre>


# 04 delete
kubectl delete -f Kubernetes.yaml

<pre style="font-size: 12px;">
&nbsp;eksctl delete cluster           \
&nbsp;    --name=stevepro-aws-eks     \
&nbsp;    --region eu-west-1          \
&nbsp;    --force                     \
&nbsp;    --parallel 10
</pre>


