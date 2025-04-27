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


eksctl
<table width="99%" border="1">
<tr><td>
&nbsp;curl --silent --location "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$(uname <br />&nbsp;-s)_amd64.tar.gz" | tar xz -C /tmp<br />
&nbsp;sudo mv /tmp/eksctl /usr/local/bin<br />
</td></tr>
</table>
<br />


Pre-Requisites
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;aws sso login
</pre>
</td></tr>
</table>
<br />


Check resources
<table width="99%" border="1">
<tr>
<td valign="top">
&nbsp;&nbsp;aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output table<br />
&nbsp;&nbsp;aws ec2 describe-addresses --query 'Addresses[*].PublicIp' --output table<br />
&nbsp;&nbsp;aws ec2 describe-key-pairs --query 'KeyPairs[*].KeyName' --output table<br />
&nbsp;&nbsp;aws ec2 describe-volumes --query 'Volumes[*].VolumeId' --output table<br />
&nbsp;&nbsp;aws ec2 describe-vpcs --query 'Vpcs[*].VpcId' --output table<br />
&nbsp;&nbsp;aws cloudformation list-stacks --query 'StackSummaries[*].StackName' --output table<br />  
&nbsp;&nbsp;aws cloudwatch describe-alarms --query 'MetricAlarms[*].AlarmName' --output table<br />
&nbsp;&nbsp;aws ecr describe-repositories --query 'repositories[*].repositoryName' --output table<br />
&nbsp;&nbsp;aws ecs list-clusters --query 'clusterArns' --output table<br />
&nbsp;&nbsp;aws eks list-clusters --query 'clusters' --output table<br />
&nbsp;&nbsp;aws elasticbeanstalk describe-environments --query 'Environments[*].EnvironmentName' --output table<br />
&nbsp;&nbsp;aws elb describe-load-balancers --query 'LoadBalancerDescriptions[*].LoadBalancerName' --output table<br />
&nbsp;&nbsp;aws elbv2 describe-load-balancers --query 'LoadBalancers[*].LoadBalancerName' --output table<br />
&nbsp;&nbsp;aws iam list-roles --query 'Roles[*].RoleName' --output table<br />
&nbsp;&nbsp;aws iam list-users --query 'Users[*].UserName' --output table<br />
&nbsp;&nbsp;aws lambda list-functions --query 'Functions[*].FunctionName' --output table<br />
&nbsp;&nbsp;aws rds describe-db-instances --query 'DBInstances[*].DBInstanceIdentifier' --output table<br />
&nbsp;&nbsp;aws route53 list-hosted-zones --query 'HostedZones[*].Name' --output table<br />
&nbsp;&nbsp;aws s3 ls<br />
&nbsp;&nbsp;aws sns list-topics --query 'Topics[*].TopicArn' --output table<br />
&nbsp;&nbsp;aws sqs list-queues --query 'QueueUrls' --output table<br />
&nbsp;&nbsp;aws ssm describe-parameters --query 'Parameters[*].Name' --output table<br />
</td>
</tr>
</table>


Kubernetes [remote]
# 00	cluster YAML
create ~/stevepro-awseks/cluster.yaml
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;kind: ClusterConfig
&nbsp;&nbsp;apiVersion: eksctl.io/v1alpha5
&nbsp;&nbsp;
&nbsp;&nbsp;metadata:
&nbsp;&nbsp;  name: stevepro-aws-eks
&nbsp;&nbsp;  region: eu-west-1
&nbsp;&nbsp;  version: "1.27"
&nbsp;&nbsp;  tags:
&nbsp;&nbsp;    createdBy: stevepro
&nbsp;&nbsp;
&nbsp;&nbsp;kubernetesNetworkConfig:
&nbsp;&nbsp;  ipFamily: IPv4
&nbsp;&nbsp;
&nbsp;&nbsp;iam:
&nbsp;&nbsp;  withOIDC: true
&nbsp;&nbsp;  serviceAccounts:
&nbsp;&nbsp;  - metadata:
&nbsp;&nbsp;      name: ebs-csi-controller-sa
&nbsp;&nbsp;      namespace: kube-system
&nbsp;&nbsp;    attachPolicyARNs:
&nbsp;&nbsp;    - "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
&nbsp;&nbsp;    roleOnly: true
&nbsp;&nbsp;    roleName: stevepro-aws-eks-AmazonEKS_EBS_CSI_DriverRole
&nbsp;&nbsp;
&nbsp;&nbsp;addons:
&nbsp;&nbsp;- name: aws-ebs-csi-driver
&nbsp;&nbsp;  version: v1.38.1-eksbuild.2
&nbsp;&nbsp;  serviceAccountRoleARN: \
&nbsp;&nbsp;	arn:aws:iam::4xxxxxxxxxx8:role/stevepro-aws-eks-AmazonEKS_EBS_CSI_DriverRole
&nbsp;&nbsp;- name: vpc-cni
&nbsp;&nbsp;  version: v1.19.2-eksbuild.1
&nbsp;&nbsp;- name: coredns
&nbsp;&nbsp;  version: v1.10.1-eksbuild.18
&nbsp;&nbsp;- name: kube-proxy
&nbsp;&nbsp;  version: v1.27.16-eksbuild.14
&nbsp;&nbsp;
&nbsp;&nbsp;nodeGroups:
&nbsp;&nbsp;  - name: stevepro-aws-eks
&nbsp;&nbsp;    instanceType: m5.large
&nbsp;&nbsp;    desiredCapacity: 0
&nbsp;&nbsp;    minSize: 0
&nbsp;&nbsp;    maxSize: 3
&nbsp;&nbsp;    ssh:
&nbsp;&nbsp;      allow: true
&nbsp;&nbsp;      publicKeyPath: ~/.ssh/master_ssh_key.pub
&nbsp;&nbsp;    preBootstrapCommands:
&nbsp;&nbsp;      - "true"
</pre>
</td></tr>
</table>
<br />


# 01	create cluster
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;eksctl create cluster -f ~/stevepro-awseks/cluster.yaml          \
&nbsp;    --kubeconfig ~/stevepro-awseks/kubeconfig                     \
&nbsp;    --verbose 5
</pre>
</td></tr>
</table>
<br />


# 02	scale nodegroup
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;eksctl scale nodegroup                                           \
&nbsp;    --cluster=stevepro-aws-eks                                    \
&nbsp;    --name=stevepro-aws-eks                                       \
&nbsp;    --nodes=3                                                     \
&nbsp;    --nodes-min=0                                                 \
&nbsp;    --nodes-max=3                                                 \
&nbsp;    --verbose 5
</pre>
</td></tr>
</table>
<br />


COMMAND #03 DeployTest
<br>TODO - text
<br>
<table border="1" width="99%">
<tr><td>
&nbsp;kubectl create ns test-ns<br />
&nbsp;kubectl config set-context --current --namespace=test-ns<br />
&nbsp;kubectl apply -f Kubernetes.yaml<br />
&nbsp;kubectl port-forward service/flask-api-service 8080:80<br />
&nbsp;curl http://localhost:8080<br />
</td></tr>
</table>
<br />


COMMAND #04 Shell into Node - TODO
Ref: 
~\GitHub\StevePro7\Blogger\Cloud\CloudSetupCheatSheet\CloudSetupCheatSheetI\archive\CloudSetupCheatSheetNotes
<table border="1" width="99%">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;kubectl get po -o wide
&nbsp;&nbsp;cd ~/.ssh
&nbsp;&nbsp;ssh -i master_ssh_key ec2-user@node-ip-address
# &nbsp;&nbsp;ssh -i master_ssh_key ubuntu@node-ip-address
# &nbsp;&nbsp;ssh -i master_ssh_key root@node-ip-address
</pre>
</td></tr>
</table>
<br />


COMMAND #05 Cleanup
<table border="1" width="99%">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;kubectl delete -f Kubernetes.yaml
&nbsp;&nbsp;kubectl delete ns test-ns
</pre>
</td></tr>
</table>
<br />


# 06 delete
kubectl delete -f Kubernetes.yaml
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;eksctl delete cluster                                            \
&nbsp;    --name=stevepro-aws-eks                                       \
&nbsp;    --region eu-west-1                                            \
&nbsp;    --force
</pre>
</td></tr>
</table>
<br />



ARCHIVE
eksctl create cluster -f ~/stevepro-awseks/cluster.yaml \
    --kubeconfig ~/stevepro-awseks/kubeconfig           \
    --verbose 5




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
