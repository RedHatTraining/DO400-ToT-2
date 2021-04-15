#!/bin/bash

# Deploy: currency service
oc new-app --name currency \
    https://github.com/RedHatTraining/DO400-ToT-2#main \
    --context-dir=currency \
    --strategy=docker

# Deploy: history service
oc new-app --name history \
    https://github.com/RedHatTraining/DO400-ToT-2#main \
    --context-dir=history \
    --strategy=docker

# Deploy: frontend service
oc new-app --name frontend \
    https://github.com/RedHatTraining/DO400-ToT-2#main \
    --context-dir=frontend \
    --strategy=docker \
    --build-env REACT_APP_GW_ENDPOINT=http://exchange-do400-tot-2-app.apps.na46.prod.nextcle.com/

# Exposing the frontend service
oc expose svc/frontend

# Deploy: email service
oc apply -f kubefiles/email-service.yml