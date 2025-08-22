#!/usr/bin/env bash
set -euo pipefail
TARGET=${1:-http://$(minikube ip):30080}
docker run --rm -t owasp/zap2docker-stable zap-baseline.py \
  -t "$TARGET" -r zap-report.html -x zap-report.xml || true
echo "DAST finished. Check zap-report.html"
