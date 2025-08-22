#!/usr/bin/env bash
set -euo pipefail
GIT_SHA=$(git rev-parse --short HEAD || echo "dev")
docker build -t pay-svc:${GIT_SHA} -t pay-svc:local -f docker/Dockerfile .
