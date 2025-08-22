#!/usr/bin/env bash
set -euo pipefail
if ! command -v trivy >/dev/null 2>&1; then
  echo "Trivy 未安装，跳过镜像扫描（macOS: brew install trivy）"
  exit 0
fi
IMG=${1:-pay-svc:local}
trivy image --severity HIGH,CRITICAL --no-progress --exit-code 1 "$IMG"
