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


COMMAND #03 Destroy
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;gcloud container clusters delete stevepro-gcp-gke	\
&nbsp;    --zone europe-west1-b				\
&nbsp;    --async --quiet --verbosity debug
</pre>
</td></tr>
</table>
<br />

