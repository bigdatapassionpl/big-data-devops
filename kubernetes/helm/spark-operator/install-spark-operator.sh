#!/bin/bash

export HELM_REPO_NAME=spark-operator
export HELM_REPO_URL=https://googlecloudplatform.github.io/spark-on-k8s-operator
export HELM_CHART=spark-operator
export HELM_CHART_VERSION=1.1.26

./install-helm.sh
