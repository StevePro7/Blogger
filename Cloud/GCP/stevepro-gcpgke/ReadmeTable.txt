README table
23-Mar-2025

# 01	Create
<pre style="font-size: 12px;">
&nbsp;gcloud container clusters create stevepro-gcp-gke   \
&nbsp;    --zone europe-west1-b                           \
&nbsp;    --num-nodes 3                                   \
&nbsp;    --machine-type e2-medium                        \
&nbsp;    --image-type COS_CONTAINERD
</pre>
<br />


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



# 03 Destroy
<pre style="font-size: 12px;">
&nbsp;gcloud container clusters delete example-cluster    \
&nbsp;    --zone europe-west1-b                           \
&nbsp;    --async --quiet --verbosity debug
</pre>
<br />
