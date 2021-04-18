#!/bin/bash

oc patch deployment/exchange \
  -n ${1} \
  -p "{\"spec\": {\"template\": {\"metadata\": { \"labels\": {  \"redeploy\": \"$(date +%s)\"}}}}}"

