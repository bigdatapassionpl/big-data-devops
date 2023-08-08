#!/bin/bash

export HELM_REPO_DIR=/Users/radek/projects/github/dremio/dremio-cloud-tools/charts/
export HELM_CHART=dremio_v2

export HELM_DIR=dremio
export HELM_NAMESPACE=dremio
export HELM_RELEASE=dremio

time helm upgrade $HELM_RELEASE $HELM_REPO_DIR/$HELM_CHART \
  --install \
  --timeout 10m \
  --cleanup-on-fail \
  --create-namespace \
  --namespace $HELM_NAMESPACE \
  --values $HELM_DIR/values.yaml
