#!/usr/bin/env bash
PROJECT_ID=devopstar
REGION=australia-southeast1

gcloud beta container clusters create "$PROJECT_ID-gpt2-demo" \
    --project "$PROJECT_ID" \
    --zone "$REGION-a" \
    --no-enable-basic-auth \
    --cluster-version "1.12.6-gke.10" \
    --machine-type "n1-standard-4" \
    --image-type "COS" \
    --disk-type "pd-standard" \
    --disk-size "100" \
    --metadata disable-legacy-endpoints=true \
    --scopes "https://www.googleapis.com/auth/cloud-platform" \
    --num-nodes "3" \
    --enable-stackdriver-kubernetes \
    --enable-ip-alias \
    --network "projects/$PROJECT_ID/global/networks/default" \
    --subnetwork "projects/$PROJECT_ID/regions/$REGION/subnetworks/default" \
    --default-max-pods-per-node "110" \
    --addons HorizontalPodAutoscaling,HttpLoadBalancing,Istio,CloudRun \
    --istio-config auth=MTLS_PERMISSIVE \
    --enable-autoupgrade \
    --enable-autorepair