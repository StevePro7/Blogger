AWS EKS
22-Apr-2025

IMPORTANT
today I was doing stevepro-awseks01 on iMac

after provisioning cluster and copy kubeconfig file
any interaction w/ cluster was giving error

aws eks download kubeconfig file but any kubectl commands give You must be logged in to the server (Unauthorized)

Chat GPT
here is what solved the issue!

aws eks update-kubeconfig --name stevepro-aws-eks --region eu-west-1 --profile SteveProXNA


Now I can resume kubectl commands
e.g.
kubectl get svc