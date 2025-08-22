#!/usr/bin/env bash
set -euo pipefail
if ! command -v gitleaks >/dev/null 2>&1; then
  echo "Gitleaks 未安装，跳过密钥扫描（macOS: brew install gitleaks）"
  exit 0
fi
gitleaks detect --no-banner --redact
