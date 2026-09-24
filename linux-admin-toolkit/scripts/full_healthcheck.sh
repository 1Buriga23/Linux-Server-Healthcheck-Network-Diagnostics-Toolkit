#!/bin/bash

DATA=$(date +"%Y-%m-%d %H:%M:%S")

SERVICE="${1:-nginx}"
DISK="${2:-/}"
URL="${3:-http://localhost}"

echo "========================================"
echo "FULL LINUX HEALTHCHECK REPORT"
echo "========================================"

echo

echo "Дата проверки:"
echo "$DATA"

echo
./scripts/system_report.sh
echo
./scripts/disk_check.sh "$DISK"
echo
./scripts/memory_check.sh
echo
./scripts/check_service.sh "$SERVICE"
echo
./scripts/nginx_healthcheck.sh
echo
./scripts/network_report.sh
echo
./scripts/port_check.sh
echo
./scripts/http_check.sh "$URL"
echo
./scripts/log_errors_check.sh "$SERVICE"
echo

echo "========================================"
echo "ИТОГ: комплексная проверка завершена"
echo "========================================"
