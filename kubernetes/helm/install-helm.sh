#!/bin/bash

export HELM_DIR=$HELM_CHART
export HELM_NAMESPACE=$HELM_CHART
export HELM_RELEASE=$HELM_REPO_NAME

helm repo add $HELM_REPO_NAME $HELM_REPO_URL
helm repo list
helm repo update

helm search repo $HELM_REPO_NAME

helm show values $HELM_REPO_NAME/$HELM_CHART --version=$HELM_CHART_VERSION > $HELM_DIR/values-default.yaml

time helm upgrade $HELM_RELEASE $HELM_REPO_NAME/$HELM_CHART \
  --install \
  --timeout 10m \
  --cleanup-on-fail \
  --create-namespace \
  --namespace $HELM_NAMESPACE \
  --values $HELM_DIR/values.yaml \
  --version=$HELM_CHART_VERSION
