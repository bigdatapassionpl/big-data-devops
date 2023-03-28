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

helm uninstall $HELM_RELEASE \
  --namespace $HELM_NAMESPACE
