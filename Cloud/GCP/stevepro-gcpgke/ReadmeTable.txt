README table
23-Mar-2025

COMMAND #01 Create
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;gcloud container clusters create stevepro-gcp-gke	\
&nbsp;    --zone europe-west1-b				\
&nbsp;    --num-nodes 1					\
&nbsp;    --machine-type e2-medium				\
&nbsp;    --image-type COS_CONTAINERD
</pre>
</td></tr>
</table>
<br />


COMMAND #02 Credentials
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;gcloud container clusters get-credentials stevepro-gcp-gke	\
&nbsp;    --zone=europe-west1-b					\
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
&nbsp;kubectl create ns test-ns<br />
&nbsp;kubectl config set-context --current --namespace=test-ns<br />
&nbsp;kubectl apply -f Kubernetes.yaml<br />
&nbsp;kubectl port-forward service/flask-api-service 8080:80<br />
&nbsp;curl http://localhost:8080<br />
</pre>
</td></tr>
</table>
<br />


COMMAND #04 Shell into Node
<table border="1" width="99%">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;mkdir -p ~/GitHub/luksa
&nbsp;cd ~/GitHub/luksa
&nbsp;git clone https://github.com/luksa/kubectl-plugins.git
&nbsp;cd kubectl-plugins
&nbsp;chmod +x kubectl-ssh
&nbsp;kubectl get nodes
&nbsp;./kubectl-ssh node gke-stevepro-gcp-gke-default-pool-0b4ca8ca-sjpj
</pre>
</td></tr>
</table>
<br />



COMMAND #05 Destroy
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;gcloud container clusters delete stevepro-gcp-gke	\
&nbsp;    --zone europe-west1-b				\
&nbsp;    --quiet --verbosity debug
</pre>
</td></tr>
</table>
<br />

