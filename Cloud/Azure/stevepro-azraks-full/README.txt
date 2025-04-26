AZR AKS
17-Mar-2025

PROCESS
cd
mkdir -p stevepro-azraks

# 00	security principal
az login
az ad sp create-for-rbac --name stevepro-sp --skip-assignment

# 02
eksctl create cluster -f ~/stevepro-awseks02/cluster.yaml \
    --kubeconfig ~/stevepro-awseks02/kubeconfig           \
    --verbose 5


KUBECONFIG
cp ~/stevepro-awseks02/kubeconfig ~/.kube/config


./kubectl-ssh node ip-192-168-14-103.eu-west-1.compute.internal


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

# 04 delete
kubectl delete -f Kubernetes.yaml

eksctl delete cluster           \
    --name=stevepro-aws-eks02   \
    --region eu-west-1          \
    --force


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


eksctl delete cluster --name  stevepro-aws-eks02 --region eu-west-1 --force

Terminate
EC2
NAT gateway
VPI