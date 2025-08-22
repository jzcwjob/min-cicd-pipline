#!/usr/bin/env bash
set -euo pipefail
if ! command -v trivy >/dev/null 2>&1; then
  echo "Trivy 未安装，跳过镜像扫描（macOS: brew install trivy）"
  exit 0
fi
IMG=${1:-pay-svc:local}
# 关键参数：
# --ignore-unfixed  只拦有“Fixed Version”的漏洞
# --severity        只看 HIGH/CRITICAL
# --exit-code 1     有命中则失败（用于门禁）
trivy image \
  --severity HIGH,CRITICAL \
  --ignore-unfixed \
  --no-progress \
  --exit-code 1 \
  "$IMG"
