README table
23-Mar-2025
COMMAND #01 Create
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;&nbsp;gcloud container clusters create stevepro-gcp-gke               \
&nbsp;    --project=steveproproject                                     \
&nbsp;    --zone europe-west1-b                                         \
&nbsp;    --machine-type=e2-standard-2                                  \
&nbsp;    --disk-type pd-standard                                       \
&nbsp;    --cluster-version=1.30.10-gke.1070000                         \
&nbsp;    --num-nodes 3                                                 \
&nbsp;    --network=default                                             \
&nbsp;    --create-subnetwork=name=stevepro-gcp-gke-subnet,range=/28    \
&nbsp;    --enable-ip-alias                                             \
&nbsp;    --enable-intra-node-visibility                                \
&nbsp;    --logging=NONE                                                \
&nbsp;    --monitoring=NONE                                             \
&nbsp;    --enable-network-policy                                       \
&nbsp;    --labels=prefix=stevepro-gcp-gke,created-by=${USER}           \
&nbsp;    --quiet --verbosity debug
</pre>
</td></tr>
</table>
<br />


COMMAND #02 Credentials
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;gcloud container clusters get-credentials stevepro-gcp-gke       \
&nbsp;    --zone=europe-west1-b                                         \
&nbsp;    --quiet --verbosity debug
</pre>
</td></tr>
</table>
<br />


COMMAND #03 DeployTest
<br>TODO - text
<table border="1" width="99%">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;kubectl create ns test-ns<br />
&nbsp;&nbsp;kubectl config set-context --current --namespace=test-ns<br />
&nbsp;&nbsp;kubectl apply -f Kubernetes.yaml<br />
&nbsp;&nbsp;kubectl port-forward service/flask-api-service 8080:80<br />
&nbsp;&nbsp;curl http://localhost:8080<br />
</pre>
</td></tr>
</table>
<br />


COMMAND #04 Shell into Node
<table border="1" width="99%">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;mkdir -p ~/GitHub/luksa
&nbsp;&nbsp;cd ~/GitHub/luksa
&nbsp;&nbsp;git clone https://github.com/luksa/kubectl-plugins.git
&nbsp;&nbsp;cd kubectl-plugins
&nbsp;&nbsp;chmod +x kubectl-ssh
&nbsp;&nbsp;kubectl get nodes
&nbsp;&nbsp;./kubectl-ssh node gke-stevepro-gcp-gke-default-pool-0b4ca8ca-sjpj
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


COMMAND #06 Destroy
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;gcloud container clusters delete stevepro-gcp-gke                \
&nbsp;    --zone europe-west1-border                                    \
&nbsp;    --quiet --verbosity debug
</pre>
</td></tr>
</table>
<br />

