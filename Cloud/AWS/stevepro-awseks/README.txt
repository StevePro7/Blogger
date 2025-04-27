AWS EKS
16-Mar-2025

Pre-Reqs    eksctl
Reference:
../eksctl.txt

BEFORE
check all the resources to ensure everything is clean

https://aws.amazon.com
Sign in using root user email | Root user
../AWS-CLI-Resources.txt
../AWS-CLI-SSO.txt

PROCESS
cd
mkdir -p stevepro-awseks
create ~/stevepro-awseks/cluster.yaml


# 00 Add master key
cd ~/stevepro-awseks
ssh-keygen -t rsa -b 4096 -N '' -f ~/stevepro-awseks/master_ssh_key
eval $(ssh-agent -s)
ssh-add ~/stevepro-awseks/master_ssh_key


# 01
mkdir ~/stevepro-awseks/cluster.yaml

# 02
eksctl create cluster -f ~/stevepro-awseks/cluster.yaml \
    --kubeconfig ~/stevepro-awseks/kubeconfig           \
    --verbose 5

# 03
eksctl scale nodegroup          \
    --cluster=stevepro-aws-eks  \
    --name=stevepro-aws-eks     \
    --nodes=3                   \
    --nodes-min=0               \
    --nodes-max=3               \
    --verbose 5

OUTPUT
aws ecs list-clusters --query 'clusterArns' --output table
stevepro-aws-eks

aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE --query 'StackSummaries[*].StackName' --output table
eksctl-stevepro-aws-eks-nodegroup-stevepro-aws-eks
eksctl-stevepro-aws-eks-cluster

aws ec2 describe-vpcs --query 'Vpcs[*].VpcId' --output table
vpc-*

aws ec2 describe-key-pairs --query 'KeyPairs[*].KeyName' --output table
eksctl-stevepro-aws-eks-nodegroup-stevepro-aws-eks

KUBECONFIG
cp ~/stevepro-awseks/kubeconfig ~/.kube/config

TESTING
Deploy application
Reference: https://gitlab.com/SteveProXNA/gitlabcheatsheet

kubectl create ns test-ns
kubectl config set-context --current --namespace=test-ns

cd ~/GitLab/SteveProXNA/gitlabcheatsheet
docker build --pull --rm -f "Dockerfile" -t flask-api:latest "."
kubectl apply -f Kubernetes.yaml

kubectl port-forward service/flask-api-service 8080:80
curl http://localhost:8080


TODO
Reference:
RoutingModes
ssh -i master_ssh_key ubuntu@54.194.208.80
OR
ssh -i ~/.ssh/master_ssh_key ec2-user@34.255.0.16


# 04 delete
kubectl delete -f Kubernetes.yaml

eksctl delete cluster           \
    --name=stevepro-aws-eks     \
    --region eu-west-1          \
    --force                     \
    --parallel 10


IMPORTANT
2025-03-16 18:56:34 [!]  2 pods are unevictable from node ip-192-168-15-95.eu-west-1.compute.internal
manually Ctrl+C to quit

Therefore may have to manually delete the following resources on the AWS dashboard
NAT Gateway
EC2 instance
VPC instances

eksctl get nodegroup --cluster stevepro-aws-eks
eksctl delete nodegroup --cluster stevepro-aws-eks --name <nodegroup-name>

NB: did eventually delete all EC2 instances thus coudl delete VPC !!


CLEANUP
rm -rf ~/stevepro-awseks
