COMMAND #01 Create
<table width="99%" border="1">
<tr><td>
<pre style="font-size: 12px;">
&nbsp;&nbsp;gcloud container clusters create stevepro-gcp-gke	\
&nbsp;    --project=steveproproject				\
&nbsp;    --zone europe-west1-b				\
&nbsp;    --machine-type=e2-standard-2                                \
&nbsp;    --disk-type pd-standard                                     \
&nbsp;    --cluster-version=1.30.10-gke.1070000 	\
&nbsp;    --num-nodes 3					\
&nbsp;    --network=default		\
&nbsp;    --create-subnetwork=name=stevepro-gcp-gke-subnet,range=/28		\
&nbsp;    --enable-ip-alias		\
&nbsp;    --enable-intra-node-visibility		\
&nbsp;    --logging=NONE		\
&nbsp;    --monitoring=NONE		\
&nbsp;    --enable-network-policy		\
&nbsp;    --labels=prefix=stevepro-gcp-gke,created-by=${USER} 		\
&nbsp;    --no-enable-managed-prometheus		\
&nbsp;    --quiet --verbosity debug
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


COMMAND #06 Destroy
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

