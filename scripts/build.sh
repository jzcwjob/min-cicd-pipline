#!/usr/bin/env bash
set -euo pipefail
GIT_SHA=$(git rev-parse --short HEAD 2>/dev/null || echo "dev")
docker build -t pay-svc:local -t pay-svc:${GIT_SHA} -f docker/Dockerfile .
