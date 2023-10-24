#!/bin/bash

export K8S_NS=k8s-jobs-dev
kubectl get pods -n "$K8S_NS" --no-headers=true --field-selector=status.phase==Succeeded | grep driver | awk '{print $1}' | xargs  kubectl delete pods -n "$K8S_NS"

export K8S_NS=k8s-jobs-prod
kubectl get pods -n "$K8S_NS" --no-headers=true --field-selector=status.phase==Succeeded | grep driver | awk '{print $1}' | xargs  kubectl delete pods -n "$K8S_NS"

export K8S_NS=k8s-jobs
kubectl get pods -n "$K8S_NS" --no-headers=true --field-selector=status.phase==Succeeded | grep driver | awk '{print $1}' | xargs  kubectl delete pods -n "$K8S_NS"
