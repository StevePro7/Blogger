GCP GKE
20-Apr-2025

COMMAND #01 Create
gcloud container clusters create stevepro-gcp-gke   \
    --zone europe-west1-b                           \
    --num-nodes 3                                   \
    --machine-type e2-medium                        \
    --image-type COS_CONTAINERD


COMMAND #02 Credentials
gcloud container clusters get-credentials stevepro-gcp-gke	\
    --project=steveproproject					\
    --zone=europe-west1-b					\
    --quiet --verbosity debug


COMMAND #03 Destroy
gcloud container clusters delete stevepro-gcp-gke   \
    --zone europe-west1-b                           \
    --async --quiet --verbosity debug



cd ~/GitHub/luksa/kubectl-plugins
./kubectl-ssh node

ip addr
ip route
ip link show
ip rule show


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