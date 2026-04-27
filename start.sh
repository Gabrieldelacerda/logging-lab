#!/bin/bash
echo "Starting logging stack"
docker compose -f ~/logging-lab/logging/docker-compose.yml up -d

echo "Waiting for Loki"
sleep 15

echo "Connecting Loki to monitoring network"
docker network connect monitoring_default $(docker ps --filter "ancestor=grafana/loki" --format "{{.ID}}") 2>/dev/null || true

echo "Starting nginx"
cd ~/nginx-multisite-lab && docker compose up -d

echo "Done"
