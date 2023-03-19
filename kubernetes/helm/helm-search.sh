#!/bin/bash

echo Script name: $0
echo $# arguments
if [ $# -ne 1 ];
    then echo "illegal number of parameters"
    exit
fi

source $1/$1.sh

export HELM_DIR=$HELM_CHART
export HELM_NAMESPACE=$HELM_CHART
export HELM_RELEASE=$HELM_REPO_NAME

helm repo remove $HELM_REPO_NAME
helm repo add $HELM_REPO_NAME $HELM_REPO_URL
helm repo list
helm repo update

echo "VERSION: "$HELM_CHART_VERSION
helm search repo $HELM_REPO_NAME

helm search repo $HELM_REPO_NAME/$HELM_CHART --versions | head

helm search repo $HELM_REPO_NAME/$HELM_CHART --versions --devel | head
