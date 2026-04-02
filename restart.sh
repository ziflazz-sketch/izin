#!/usr/bin/env bash
# ============================================
# Xray Auto Restart & Health Check Script
# By Ziflazz
# No Telegram
# ============================================

echo -e "
⚡ Boosting system performance (No Limit Mode)..."

sync; echo 3 > /proc/sys/vm/drop_caches 2>/dev/null || true
ulimit -n 999999 2>/dev/null || true
ulimit -u 999999 2>/dev/null || true

echo -e "✅ System fully optimized for maximum performance!"

services=(nginx ssh dropbear paradis sketsa drawit)

echo -e "
🔄 Starting safe restart sequence for Xray services...
"
for svc in "${services[@]}"; do
  echo "🚀 Restarting $svc ..."
  systemctl restart "$svc" >/dev/null 2>&1 || true
  sleep 3
  status="$(systemctl is-active "$svc" 2>/dev/null || echo failed)"
  if [[ "$status" == "active" ]]; then
    echo "✅ $svc : Active"
  else
    echo "❌ $svc : Failed"
  fi
  echo '-----------------------------------------'
  sleep 1
done

echo -e "
✨ All checks completed. ✨"
