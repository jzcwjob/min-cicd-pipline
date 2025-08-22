#!/usr/bin/env bash
set -euo pipefail
if ! command -v semgrep >/dev/null 2>&1; then
  echo "Semgrep 未安装，跳过 SAST（macOS: brew install semgrep）"
  exit 0
fi
# 使用 scan 子命令，并把发现当作错误（用于门禁）
semgrep scan --config auto --error app
# 也可以只扫 Java 规则： --config p/java
