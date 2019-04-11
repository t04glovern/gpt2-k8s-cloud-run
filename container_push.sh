#!/usr/bin/env bash
PROJECT_ID=devopstar

# Set gcloud project
gcloud config set project $PROJECT_ID

# Authenticate Docker
gcloud auth configure-docker

# Build Container
docker build -t gpt-2-flask-api .

# Tag Image for GCR
docker tag gpt-2-flask-api:latest \
    asia.gcr.io/$PROJECT_ID/gpt-2-flask-api:latest

# Push to GCR
docker push asia.gcr.io/$PROJECT_ID/gpt-2-flask-api:latest
