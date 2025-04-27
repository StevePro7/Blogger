GCP GKE 02
20-Apr-2025

COMMAND #01 Create
gcloud container clusters create stevepro-gcp-gke
    --project=steveproproject
    --zone=europe-west1-b  
    --machine-type=e2-standard-2  
    --disk-type pd-standard 
    --cluster-version=1.30.9-gke.1127000 
    --num-nodes=3 
    --network=default 
    --create-subnetwork=name=stevepro-gcp-gke-subnet,range=/28 
    --enable-ip-alias 
    --enable-intra-node-visibility 
    --logging=NONE 
    --monitoring=NONE 
    --enable-network-policy 
    --labels=prefix=stevepro-gcp-gke,created-by=${USER}
    --quiet --verbosity debug 
    --no-enable-managed-prometheus


COMMAND #02 Credentials
gcloud container clusters get-credentials stevepro-gcp-gke 
    --project=steveproproject 
    --zone=europe-west1-b
    --quiet --verbosity debug


COMMAND #03 Destroy
gcloud container clusters delete stevepro-gcp-gke  
    --project=steveproproject 
    --zone=europe-west1-b  
    --async --quiet --verbosity debug || true



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