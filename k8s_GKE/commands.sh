# make persistantvolumes retain, after applying statefulsets with VolumeClaimTemplates
k get pv
# then for each
k patch pv pvc-605b7515-55ce-4646-91fb-6c7df262d171 -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'


# re. /k8s_GKE/certs
# after creating the managedcertificate resouce def, and installing the certificate-controller,
# and creating the managedcertificate for the domain, apply the annotation to the the ingress
kubectl annotate ingress [your-ingress-name] networking.gke.io/managed-certificates=mydomain-certificate

# reserve a public IP
gcloud compute addresses create api-syr-market-ip --global
# get the ip address
gcloud compute addresses describe api-syr-market-ip --global

# create the managedcertificate,
k apply -f certs/api-syr-market-certificate.yml

# then apply annotations to the exiting ingress for the cert and static ip
kubectl annotate ingress stelace-api-external kubernetes.io/ingress.global-static-ip-name=api-syr-market-ip
kubectl annotate ingress stelace-api-external networking.gke.io/managed-certificates=api-syr-market-certificate

## create resources by applying yaml files to k8s

# volume-claim for postgres
kubectl -n syr-dev apply -f volume-claim/postgres-vol-claim.yml 

# postgres
kubectl -n syr-dev apply -f deployment/postgres-deployment.yml -f service/postgres-service.yml 

# elasticsearch
kubectl -n syr-dev apply -f stateful-set/elasticsearch-stateful-set.yml -f service/elasticsearch-service.yml 

# redis
kubectl -n syr-dev apply -f stateful-set/redis-stateful-set.yml -f service/redis-service.yml

# stelace
kubectl -n syr-dev apply -f deployment/stelace-api-deployment.yml -f service/stelace-api-service.yml -f ingress/stelace-beta-api-ingress.external.yml
