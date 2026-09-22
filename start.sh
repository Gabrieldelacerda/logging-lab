#!/bin/bash
set -e

BASE="$HOME/projects"

echo "Starting observability stack"
docker compose -f "$BASE/observability-stack-lab/monitoring/docker-compose.yml" up -d

echo "Starting logging stack"
docker compose -f "$BASE/logging-lab/logging/docker-compose.yml" up -d

echo "Waiting for Loki"
for i in {1..20}; do
    if curl -fsS http://localhost:3100/ready >/dev/null 2>&1; then
        echo "Loki is ready"
        break
    fi
    sleep 2
done

curl -fsS http://localhost:3100/ready >/dev/null

echo "Starting Nginx lab"
docker compose -f "$BASE/nginx-multisite-lab-V2/docker-compose.yml" up -d --build

echo "Logging environment is ready"
