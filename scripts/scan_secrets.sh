#!/usr/bin/env bash
set -euo pipefail
semgrep --version
semgrep scan --config auto app || (echo "Semgrep issues found"; exit 1)
