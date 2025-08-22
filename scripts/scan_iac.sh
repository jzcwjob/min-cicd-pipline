#!/usr/bin/env bash
set -euo pipefail
if [ ! -d k8s ]; then
  echo "未找到 k8s/ 目录，跳过 IaC 扫描"
  exit 0
fi
if ! command -v trivy >/dev/null 2>&1; then
  echo "Trivy 未安装，跳过 IaC 扫描（macOS: brew install trivy）"
  exit 0
fi
trivy config --severity HIGH,CRITICAL --exit-code 1 k8s
