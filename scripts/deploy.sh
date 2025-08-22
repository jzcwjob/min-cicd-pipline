#!/usr/bin/env bash
set -euo pipefail
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl rollout status deploy/pay-svc
