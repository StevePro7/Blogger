README table
23-Mar-2025

COMMAND #01 Create
<pre style="font-size: 12px;">
&nbsp;gcloud container clusters create stevepro-gcp-gke	  \
&nbsp;    --zone europe-west1-b                           \
&nbsp;    --num-nodes 3                                   \
&nbsp;    --machine-type e2-medium                        \
&nbsp;    --image-type COS_CONTAINERD
</pre>
<br />


COMMAND #02 Credentials
<pre style="font-size: 12px;">
&nbsp;gcloud container clusters get-credentials stevepro-gcp-gke	\
&nbsp;    --zone=europe-west1-b					\
&nbsp;    --quiet --verbosity debug
</pre>
<br />


COMMAND #03 Destroy
<pre style="font-size: 12px;">
&nbsp;gcloud container clusters delete example-cluster    \
&nbsp;    --zone europe-west1-b                           \
&nbsp;    --async --quiet --verbosity debug
</pre>
<br />

