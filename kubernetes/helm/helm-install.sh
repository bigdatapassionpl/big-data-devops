#!/bin/bash

echo Script name: $0
echo $# arguments
if [ $# -eq 1 ]
then
  echo $1
  source $1/$1.sh
  if [ -z "$HELM_DIR" ]; then export HELM_DIR=$1; fi
  if [ -z "$HELM_NAMESPACE" ]; then export HELM_NAMESPACE=$1; fi
  if [ -z "$HELM_RELEASE" ]; then export HELM_RELEASE=$1; fi
elif [ $# -eq 2 ]
then
  echo "$1 $2"
  source $1-$2/$2.sh
  if [ -z "$HELM_DIR" ]; then export HELM_DIR=$1-$2; fi
  if [ -z "$HELM_NAMESPACE" ]; then export HELM_NAMESPACE=$1-$2; fi
  if [ -z "$HELM_RELEASE" ]; then export HELM_RELEASE=$1-$2; fi
else
  echo "illegal number of parameters"
  exit
fi

echo "HELM_REPO_NAME=$HELM_REPO_NAME"
echo "HELM_REPO_URL=$HELM_REPO_URL"
echo "HELM_REPO_DIR=$HELM_REPO_DIR"
echo "HELM_CHART=$HELM_CHART"
echo "HELM_CHART_VERSION=$HELM_CHART_VERSION"
echo "HELM_DIR=$HELM_DIR"
echo "HELM_NAMESPACE=$HELM_NAMESPACE"
echo "HELM_RELEASE=$HELM_RELEASE"



if [ -n "$HELM_REPO_NAME" ]
then
  echo "Installing Helm Chart from repository"
  time helm upgrade $HELM_RELEASE $HELM_REPO_NAME/$HELM_CHART \
    --install \
    --timeout 10m \
    --cleanup-on-fail \
    --create-namespace \
    --namespace $HELM_NAMESPACE \
    --values $HELM_DIR/values.yaml \
    --version=$HELM_CHART_VERSION
else
  echo "Installing Helm Chart from local directory"
  time helm upgrade $HELM_RELEASE $HELM_REPO_DIR/$HELM_CHART \
    --install \
    --timeout 10m \
    --cleanup-on-fail \
    --create-namespace \
    --namespace $HELM_NAMESPACE \
    --values $HELM_DIR/values.yaml
fi


unset HELM_REPO_NAME
unset HELM_REPO_URL
unset HELM_REPO_DIR
unset HELM_CHART
unset HELM_CHART_VERSION
unset HELM_DIR
unset HELM_NAMESPACE
unset HELM_RELEASE
