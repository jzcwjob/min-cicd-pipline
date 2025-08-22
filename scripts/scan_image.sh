#!/usr/bin/env bash
set -euo pipefail
IMG=${1:-pay-svc:local}
trivy image --severity HIGH,CRITICAL --no-progress --exit-code 1 "$IMG"
