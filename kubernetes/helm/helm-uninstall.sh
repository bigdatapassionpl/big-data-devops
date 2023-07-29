#!/bin/bash

echo Script name: $0
echo $# arguments
if [ $# -eq 1 ]
then
  echo $1
  source $1/$1.sh
  export HELM_DIR=$1
elif [ $# -eq 2 ]
then
  echo "$1 $2"
  source $1-$2/$2.sh
  export HELM_DIR=$1-$2
else
  echo "illegal number of parameters"
  exit
fi

if [ -z "$HELM_NAMESPACE" ]; then export HELM_NAMESPACE=$HELM_CHART; fi
if [ -z "$HELM_RELEASE" ]; then export HELM_RELEASE=$HELM_REPO_NAME; fi

echo "HELM_REPO_NAME=$HELM_REPO_NAME"
echo "HELM_REPO_URL=$HELM_REPO_URL"
echo "HELM_CHART=$HELM_CHART"
echo "HELM_CHART_VERSION=$HELM_CHART_VERSION"
echo "HELM_DIR=$HELM_DIR"
echo "HELM_NAMESPACE=$HELM_NAMESPACE"
echo "HELM_RELEASE=$HELM_RELEASE"



helm uninstall $HELM_RELEASE \
  --namespace $HELM_NAMESPACE



unset HELM_REPO_NAME
unset HELM_REPO_URL
unset HELM_CHART
unset HELM_CHART_VERSION
unset HELM_DIR
unset HELM_NAMESPACE
unset HELM_RELEASE
