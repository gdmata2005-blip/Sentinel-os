#!/usr/bin/env bash
set -euo pipefail

LOG_DIR="${LOG_DIR:-/logs}"
HEARTBEAT_SECONDS="${HEARTBEAT_SECONDS:-300}"

mkdir -p "$LOG_DIR"

echo "[init] SentinelOS container iniciado. Log en $LOG_DIR/health.log"
while true; do
  /app/scripts/health.sh >> "$LOG_DIR/health.log" 2>&1 || true
  sleep "$HEARTBEAT_SECONDS"
done
