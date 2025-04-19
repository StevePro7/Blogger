README table
23-Mar-2025

# 01	cluster YAML
create ~/stevepro-awseks/cluster.yaml

<pre style="font-size: 12px;">
&nbsp;kind: ClusterConfig
&nbsp;apiVersion: eksctl.io/v1alpha5
&nbsp;metadata:
&nbsp;  name: stevepro-aws-eks
&nbsp;  region: eu-west-1
&nbsp;nodeGroups:
&nbsp;  - name: stevepro-aws-eks
&nbsp;    instanceType: m5.large
&nbsp;    desiredCapacity: 1
&nbsp;cloudWatch:
&nbsp;    clusterLogging:
&nbsp;      enableTypes: ["all"]
</pre>
<br />


# 02	create cluster
<pre style="font-size: 12px;">
&nbsp;eksctl create cluster -f ~/stevepro-awseks/cluster.yaml \
&nbsp;    --kubeconfig ~/stevepro-awseks/kubeconfig           \
&nbsp;    --verbose 5
</pre>
<br />


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
<br />



ARCHIVE
eksctl create cluster -f ~/stevepro-awseks/cluster.yaml \
    --kubeconfig ~/stevepro-awseks/kubeconfig           \
    --verbose 5

